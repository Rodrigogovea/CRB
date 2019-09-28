using System;
namespace CRB.MOD
{
    public class MOD_Utilerias
    {
        public string MD5(string strConvertir)
        {

            // Convertimos la cadena de entrada en arreglo de bytes desde MD5
            System.Security.Cryptography.MD5 objMD5 = System.Security.Cryptography.MD5.Create();
            byte[] inbuf = System.Text.Encoding.UTF8.GetBytes(strConvertir);
            byte[] outbuf = objMD5.ComputeHash(inbuf);
            objMD5.Clear();

            // Se formatea el arreglo de bytes en hexadecimal
            char pad = '0';
            string strConvertido = "";
            for (int i = 0; i <= outbuf.Length - 1; i++)
                strConvertido += outbuf[i].ToString("x").PadLeft(2,pad);

            return strConvertido;
        }

        public void GuardaError(Exception ex)
        {
                // Se guarda el mensaje del error y el StackTrace en el archivo
                System.IO.StreamWriter objStreamWriter;
                objStreamWriter = System.IO.File.AppendText(System.AppDomain.CurrentDomain.BaseDirectory + @"\ErrorLogs\"
                                                            + String.Format(DateTime.Now.ToLongDateString(), "yyyyMM") + ".txt");
                objStreamWriter.WriteLine("FECHA: " + String.Format(DateTime.Now.ToLongDateString(), "dd/MMM/yyyy hh:mm:ss tt")
                                            + "  MENSAJE: " + ex.Message + " STACKTRACE: " + ex.StackTrace + Environment.NewLine );
                objStreamWriter.Close();
        }


    }
}
