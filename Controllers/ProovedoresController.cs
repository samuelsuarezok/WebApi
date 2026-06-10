using Microsoft.AspNetCore.Mvc;
using WebApi.Data;
using WebApi.Models;

namespace WebApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ProveedoresController : ControllerBase
    {
        private readonly AppDbContext _context;

        public ProveedoresController(AppDbContext context)
        {
            _context = context;
        }

        [HttpGet]
        public List<Proveedor> Get()
        {
            return _context.Proveedores.ToList();
        }

        [HttpGet("{id}")]
        public Proveedor Get(int id)
        {
            return _context.Proveedores.Find(id);
        }

        [HttpPost]
        public void Post([FromBody] Proveedor proveedor)
        {
            proveedor.FechaAlta = DateTime.Now;
            _context.Proveedores.Add(proveedor);
            _context.SaveChanges();
        }

        [HttpPut("{id}")]
        public void Put(int id, [FromBody] Proveedor proveedor)
        {
            proveedor.IdProveedor = id;
            _context.Proveedores.Update(proveedor);
            _context.SaveChanges();
        }

        [HttpDelete("{id}")]
        public void Delete(int id)
        {
            var proveedor = _context.Proveedores.Find(id);
            if (proveedor != null)
            {
                proveedor.Activo = false;
                _context.SaveChanges();
            }
        }
    }
}