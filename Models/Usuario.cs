using System.ComponentModel.DataAnnotations;

namespace WebApi.Models
{
    public class Usuario
    {
        [Key]
        public int IdUsuario { get; set; }
        public string Email { get; set; }
        public string Clave { get; set; }
        public string Rol { get; set; }
        public bool Activo { get; set; }
    }
}