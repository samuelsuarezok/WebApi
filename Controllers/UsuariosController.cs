using Microsoft.AspNetCore.Mvc;
using WebApi.Data;
using WebApi.Models;

namespace WebApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UsuariosController : ControllerBase
    {
        private readonly AppDbContext _context;

        public UsuariosController(AppDbContext context)
        {
            _context = context;
        }

        [HttpGet]
        public List<Usuario> Get()
        {
            return _context.Usuarios.ToList();
        }

        [HttpGet("{id}")]
        public Usuario Get(int id)
        {
            return _context.Usuarios.Find(id);
        }

        [HttpPost]
        public void Post([FromBody] Usuario usuario)
        {
            _context.Usuarios.Add(usuario);
            _context.SaveChanges();
        }

        [HttpPut("{id}")]
        public void Put(int id, [FromBody] Usuario usuario)
        {
            usuario.IdUsuario = id;
            _context.Usuarios.Update(usuario);
            _context.SaveChanges();
        }

        [HttpDelete("{id}")]
        public void Delete(int id)
        {
            var usuario = _context.Usuarios.Find(id);
            if (usuario != null)
            {
                usuario.Activo = false;
                _context.SaveChanges();
            }
        }

        [HttpPost("login")]
        public IActionResult Login([FromBody] LoginRequest datos)
        {
            var usuario = _context.Usuarios.FirstOrDefault(u => 
                u.Email == datos.Email && u.Clave == datos.Clave && u.Activo == true);

            if (usuario == null)
                return Unauthorized("Email o clave incorrectos");

            return Ok(usuario);
        }
    }
}