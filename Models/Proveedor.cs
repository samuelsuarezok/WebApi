using System.ComponentModel.DataAnnotations;

namespace WebApi.Models
{
    public class Proveedor
    {
        [Key]
        public int IdProveedor { get; set; }
        public string RazonSocial { get; set; }
        public string CUIT { get; set; }
        public string Email { get; set; }
        public string Telefono { get; set; }
        public string Direccion { get; set; }
        public string Localidad { get; set; }
        public string Provincia { get; set; }
        public string Rubro {get; set; }
        public DateTime FechaAlta {get; set; }
        public bool Activo { get; set; }
    }
}