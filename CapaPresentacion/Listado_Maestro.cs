using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
namespace CapaPresentacion
{
    public partial class Listado_Maestro : Form
    {
        public Listado_Maestro()
        {
            InitializeComponent();
            this.Load += Listado_Maestro_Load;
            this.Resize += Listado_Maestro_Resize;
        }

        private void Listado_Maestro_Load(object sender, EventArgs e)
        {
            RepositionTopControls();
        }

        private void Listado_Maestro_Resize(object sender, EventArgs e)
        {
            RepositionTopControls();
        }

        private void RepositionTopControls()
        {
            // Asegurar que los controles de la cabecera queden siempre alineados a la derecha.
            if (this.picUser != null)
            {
                int rightPadding = 200;
                int usernameOffset = 150;
                int buttonOffset = 95;

                // Posiciones mínimas para evitar solapamiento con la barra lateral
                int minLeft = this.panelSidebar != null ? this.panelSidebar.Width + 240 : 240;

                this.picUser.Left = Math.Max(minLeft, this.ClientSize.Width - rightPadding);
                if (this.lblUsername != null)
                {
                    this.lblUsername.Left = Math.Max(minLeft + 40, this.ClientSize.Width - usernameOffset);
                }
                if (this.btnCerrarSesion != null)
                {
                    this.btnCerrarSesion.Left = Math.Max(minLeft + 85, this.ClientSize.Width - buttonOffset);
                }
            }
        }
    }
}