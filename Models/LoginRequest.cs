namespace WebApi.Models
{
    // Objeto que recibe el login: solo email y clave.
    // Se usa para no exigir el resto de los campos del Usuario (Rol, etc.) al iniciar sesion.
    public class LoginRequest
    {
        public string Email { get; set; }
        public string Clave { get; set; }
    }
}
