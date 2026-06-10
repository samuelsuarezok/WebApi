using Microsoft.AspNetCore.Mvc;
using WebApi.Data;
using WebApi.Models;

namespace WebApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ClientesController : ControllerBase
    {
        private readonly AppDbContext _context;

        public ClientesController(AppDbContext context)
        {
            _context = context;
        }

        [HttpGet]
        public List<Cliente> Get()
        {
            return _context.Clientes.ToList();
        }

        [HttpGet("{id}")]
        public Cliente Get(int id)
        {
            return _context.Clientes.Find(id);
        }

        [HttpPost]
        public void Post([FromBody] Cliente cliente)
        {
            cliente.FechaAlta = DateTime.Now;
            _context.Clientes.Add(cliente);
            _context.SaveChanges();
        }

        [HttpPut("{id}")]
        public void Put(int id, [FromBody] Cliente cliente)
        {
            cliente.IdCliente = id;
            _context.Clientes.Update(cliente);
            _context.SaveChanges();
        }

        [HttpDelete("{id}")]
        public void Delete(int id)
        {
            var cliente = _context.Clientes.Find(id);
            if (cliente != null)
            {
                cliente.Activo = false;
                _context.SaveChanges();
            }
        }
    }
}