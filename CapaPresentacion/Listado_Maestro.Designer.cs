using System;
using System.ComponentModel;
using System.Drawing;
using System.Windows.Forms;

namespace CapaPresentacion
{
    partial class Listado_Maestro
    {
        private IContainer components = null;
        private Panel panelSidebar;
        private Button btnMenuConfiguracion;
        private Button btnMenuMaterias;
        private Button btnMenuContacto;
        private Button btnMenuMaestros;
        private Button btnMenuListadoCursos;
        private Button btnMenuRegistrar;
        private Panel panelTop;
        private Label lblAppTitle;
        private PictureBox picUser;
        private Label lblUsername;
        private Button btnCerrarSesion;
        private Panel panelContent;
        private Label lblHeading;
        private DataGridView dgvMaestros;
        private Panel panelFooter;
        private Label lblFooter;

        // Declaraciones de las columnas (faltaban y provocaban los errores)
        private DataGridViewTextBoxColumn Maestro;
        private DataGridViewTextBoxColumn Materia;
        private DataGridViewTextBoxColumn Email;

        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        private void InitializeComponent()
        {
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle1 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle2 = new System.Windows.Forms.DataGridViewCellStyle();
            this.panelSidebar = new System.Windows.Forms.Panel();
            this.btnMenuConfiguracion = new System.Windows.Forms.Button();
            this.btnMenuMaterias = new System.Windows.Forms.Button();
            this.btnMenuContacto = new System.Windows.Forms.Button();
            this.btnMenuMaestros = new System.Windows.Forms.Button();
            this.btnMenuListadoCursos = new System.Windows.Forms.Button();
            this.btnMenuRegistrar = new System.Windows.Forms.Button();
            this.panelTop = new System.Windows.Forms.Panel();
            this.lblAppTitle = new System.Windows.Forms.Label();
            this.picUser = new System.Windows.Forms.PictureBox();
            this.lblUsername = new System.Windows.Forms.Label();
            this.btnCerrarSesion = new System.Windows.Forms.Button();
            this.panelContent = new System.Windows.Forms.Panel();
            this.lblHeading = new System.Windows.Forms.Label();
            this.dgvMaestros = new System.Windows.Forms.DataGridView();
            this.Maestro = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Materia = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Email = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.panelFooter = new System.Windows.Forms.Panel();
            this.lblFooter = new System.Windows.Forms.Label();
            this.panelSidebar.SuspendLayout();
            this.panelTop.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.picUser)).BeginInit();
            this.panelContent.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dgvMaestros)).BeginInit();
            this.panelFooter.SuspendLayout();
            this.SuspendLayout();
            // 
            // panelSidebar
            // 
            this.panelSidebar.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(44)))), ((int)(((byte)(50)))), ((int)(((byte)(56)))));
            this.panelSidebar.Controls.Add(this.btnMenuConfiguracion);
            this.panelSidebar.Controls.Add(this.btnMenuMaterias);
            this.panelSidebar.Controls.Add(this.btnMenuContacto);
            this.panelSidebar.Controls.Add(this.btnMenuMaestros);
            this.panelSidebar.Controls.Add(this.btnMenuListadoCursos);
            this.panelSidebar.Controls.Add(this.btnMenuRegistrar);
            this.panelSidebar.Dock = System.Windows.Forms.DockStyle.Left;
            this.panelSidebar.Location = new System.Drawing.Point(0, 0);
            this.panelSidebar.Name = "panelSidebar";
            this.panelSidebar.Size = new System.Drawing.Size(220, 650);
            this.panelSidebar.TabIndex = 0;
            // 
            // btnMenuConfiguracion
            // 
            this.btnMenuConfiguracion.BackColor = System.Drawing.Color.Transparent;
            this.btnMenuConfiguracion.Dock = System.Windows.Forms.DockStyle.Top;
            this.btnMenuConfiguracion.FlatAppearance.BorderSize = 0;
            this.btnMenuConfiguracion.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnMenuConfiguracion.Font = new System.Drawing.Font("Segoe UI", 9F);
            this.btnMenuConfiguracion.ForeColor = System.Drawing.Color.WhiteSmoke;
            this.btnMenuConfiguracion.Location = new System.Drawing.Point(0, 250);
            this.btnMenuConfiguracion.Name = "btnMenuConfiguracion";
            this.btnMenuConfiguracion.Padding = new System.Windows.Forms.Padding(20, 0, 0, 0);
            this.btnMenuConfiguracion.Size = new System.Drawing.Size(220, 50);
            this.btnMenuConfiguracion.TabIndex = 0;
            this.btnMenuConfiguracion.Text = "  Configuración";
            this.btnMenuConfiguracion.TextAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btnMenuConfiguracion.UseVisualStyleBackColor = false;
            // 
            // btnMenuMaterias
            // 
            this.btnMenuMaterias.BackColor = System.Drawing.Color.Transparent;
            this.btnMenuMaterias.Dock = System.Windows.Forms.DockStyle.Top;
            this.btnMenuMaterias.FlatAppearance.BorderSize = 0;
            this.btnMenuMaterias.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnMenuMaterias.Font = new System.Drawing.Font("Segoe UI", 9F);
            this.btnMenuMaterias.ForeColor = System.Drawing.Color.WhiteSmoke;
            this.btnMenuMaterias.Location = new System.Drawing.Point(0, 200);
            this.btnMenuMaterias.Name = "btnMenuMaterias";
            this.btnMenuMaterias.Padding = new System.Windows.Forms.Padding(20, 0, 0, 0);
            this.btnMenuMaterias.Size = new System.Drawing.Size(220, 50);
            this.btnMenuMaterias.TabIndex = 1;
            this.btnMenuMaterias.Text = "  Materias";
            this.btnMenuMaterias.TextAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btnMenuMaterias.UseVisualStyleBackColor = false;
            // 
            // btnMenuContacto
            // 
            this.btnMenuContacto.BackColor = System.Drawing.Color.Transparent;
            this.btnMenuContacto.Dock = System.Windows.Forms.DockStyle.Top;
            this.btnMenuContacto.FlatAppearance.BorderSize = 0;
            this.btnMenuContacto.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnMenuContacto.Font = new System.Drawing.Font("Segoe UI", 9F);
            this.btnMenuContacto.ForeColor = System.Drawing.Color.WhiteSmoke;
            this.btnMenuContacto.Location = new System.Drawing.Point(0, 150);
            this.btnMenuContacto.Name = "btnMenuContacto";
            this.btnMenuContacto.Padding = new System.Windows.Forms.Padding(20, 0, 0, 0);
            this.btnMenuContacto.Size = new System.Drawing.Size(220, 50);
            this.btnMenuContacto.TabIndex = 2;
            this.btnMenuContacto.Text = "  Contacto";
            this.btnMenuContacto.TextAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btnMenuContacto.UseVisualStyleBackColor = false;
            // 
            // btnMenuMaestros
            // 
            this.btnMenuMaestros.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(0)))), ((int)(((byte)(120)))), ((int)(((byte)(215)))));
            this.btnMenuMaestros.Dock = System.Windows.Forms.DockStyle.Top;
            this.btnMenuMaestros.FlatAppearance.BorderSize = 0;
            this.btnMenuMaestros.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnMenuMaestros.Font = new System.Drawing.Font("Segoe UI", 9F);
            this.btnMenuMaestros.ForeColor = System.Drawing.Color.White;
            this.btnMenuMaestros.Location = new System.Drawing.Point(0, 100);
            this.btnMenuMaestros.Name = "btnMenuMaestros";
            this.btnMenuMaestros.Padding = new System.Windows.Forms.Padding(20, 0, 0, 0);
            this.btnMenuMaestros.Size = new System.Drawing.Size(220, 50);
            this.btnMenuMaestros.TabIndex = 3;
            this.btnMenuMaestros.Text = "  Maestros";
            this.btnMenuMaestros.TextAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btnMenuMaestros.UseVisualStyleBackColor = false;
            // 
            // btnMenuListadoCursos
            // 
            this.btnMenuListadoCursos.BackColor = System.Drawing.Color.Transparent;
            this.btnMenuListadoCursos.Dock = System.Windows.Forms.DockStyle.Top;
            this.btnMenuListadoCursos.FlatAppearance.BorderSize = 0;
            this.btnMenuListadoCursos.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnMenuListadoCursos.Font = new System.Drawing.Font("Segoe UI", 9F);
            this.btnMenuListadoCursos.ForeColor = System.Drawing.Color.WhiteSmoke;
            this.btnMenuListadoCursos.Location = new System.Drawing.Point(0, 50);
            this.btnMenuListadoCursos.Name = "btnMenuListadoCursos";
            this.btnMenuListadoCursos.Padding = new System.Windows.Forms.Padding(20, 0, 0, 0);
            this.btnMenuListadoCursos.Size = new System.Drawing.Size(220, 50);
            this.btnMenuListadoCursos.TabIndex = 4;
            this.btnMenuListadoCursos.Text = "  Listado de Cursos";
            this.btnMenuListadoCursos.TextAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btnMenuListadoCursos.UseVisualStyleBackColor = false;
            // 
            // btnMenuRegistrar
            // 
            this.btnMenuRegistrar.BackColor = System.Drawing.Color.Transparent;
            this.btnMenuRegistrar.Dock = System.Windows.Forms.DockStyle.Top;
            this.btnMenuRegistrar.FlatAppearance.BorderSize = 0;
            this.btnMenuRegistrar.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnMenuRegistrar.Font = new System.Drawing.Font("Segoe UI", 9F);
            this.btnMenuRegistrar.ForeColor = System.Drawing.Color.WhiteSmoke;
            this.btnMenuRegistrar.Location = new System.Drawing.Point(0, 0);
            this.btnMenuRegistrar.Name = "btnMenuRegistrar";
            this.btnMenuRegistrar.Padding = new System.Windows.Forms.Padding(20, 0, 0, 0);
            this.btnMenuRegistrar.Size = new System.Drawing.Size(220, 50);
            this.btnMenuRegistrar.TabIndex = 5;
            this.btnMenuRegistrar.Text = "  Registrar Estudiante";
            this.btnMenuRegistrar.TextAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btnMenuRegistrar.UseVisualStyleBackColor = false;
            // 
            // panelTop
            // 
            this.panelTop.BackColor = System.Drawing.Color.White;
            this.panelTop.Controls.Add(this.lblAppTitle);
            this.panelTop.Controls.Add(this.picUser);
            this.panelTop.Controls.Add(this.lblUsername);
            this.panelTop.Controls.Add(this.btnCerrarSesion);
            this.panelTop.Dock = System.Windows.Forms.DockStyle.Top;
            this.panelTop.Location = new System.Drawing.Point(220, 0);
            this.panelTop.Name = "panelTop";
            this.panelTop.Padding = new System.Windows.Forms.Padding(16, 10, 16, 10);
            this.panelTop.Size = new System.Drawing.Size(853, 64);
            this.panelTop.TabIndex = 1;
            // 
            // lblAppTitle
            // 
            this.lblAppTitle.AutoSize = true;
            this.lblAppTitle.Font = new System.Drawing.Font("Segoe UI", 12F);
            this.lblAppTitle.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(70)))), ((int)(((byte)(70)))), ((int)(((byte)(70)))));
            this.lblAppTitle.Location = new System.Drawing.Point(240, 18);
            this.lblAppTitle.Name = "lblAppTitle";
            this.lblAppTitle.Size = new System.Drawing.Size(202, 21);
            this.lblAppTitle.TabIndex = 0;
            this.lblAppTitle.Text = "Centro Educacional Bautista";
            // 
            // picUser
            // 
            this.picUser.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.picUser.BackColor = System.Drawing.Color.LightGray;
            this.picUser.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle;
            this.picUser.Location = new System.Drawing.Point(1553, 14);
            this.picUser.Name = "picUser";
            this.picUser.Size = new System.Drawing.Size(36, 36);
            this.picUser.SizeMode = System.Windows.Forms.PictureBoxSizeMode.CenterImage;
            this.picUser.TabIndex = 1;
            this.picUser.TabStop = false;
            // 
            // lblUsername
            // 
            this.lblUsername.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.lblUsername.AutoSize = true;
            this.lblUsername.Font = new System.Drawing.Font("Segoe UI", 9F);
            this.lblUsername.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(80)))), ((int)(((byte)(80)))), ((int)(((byte)(80)))));
            this.lblUsername.Location = new System.Drawing.Point(1603, 20);
            this.lblUsername.Name = "lblUsername";
            this.lblUsername.Size = new System.Drawing.Size(62, 15);
            this.lblUsername.TabIndex = 2;
            this.lblUsername.Text = "alberto360";
            // 
            // btnCerrarSesion
            // 
            this.btnCerrarSesion.Anchor = ((System.Windows.Forms.AnchorStyles)((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Right)));
            this.btnCerrarSesion.AutoSize = true;
            this.btnCerrarSesion.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(220)))), ((int)(((byte)(53)))), ((int)(((byte)(69)))));
            this.btnCerrarSesion.FlatAppearance.BorderSize = 0;
            this.btnCerrarSesion.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btnCerrarSesion.ForeColor = System.Drawing.Color.White;
            this.btnCerrarSesion.Location = new System.Drawing.Point(1627, 16);
            this.btnCerrarSesion.Name = "btnCerrarSesion";
            this.btnCerrarSesion.Padding = new System.Windows.Forms.Padding(10, 4, 10, 4);
            this.btnCerrarSesion.Size = new System.Drawing.Size(106, 33);
            this.btnCerrarSesion.TabIndex = 3;
            this.btnCerrarSesion.Text = "Cerrar Sesión";
            this.btnCerrarSesion.UseVisualStyleBackColor = false;
            // 
            // panelContent
            // 
            this.panelContent.BackColor = System.Drawing.Color.Transparent;
            this.panelContent.Controls.Add(this.lblHeading);
            this.panelContent.Controls.Add(this.dgvMaestros);
            this.panelContent.Dock = System.Windows.Forms.DockStyle.Fill;
            this.panelContent.Location = new System.Drawing.Point(220, 64);
            this.panelContent.Name = "panelContent";
            this.panelContent.Padding = new System.Windows.Forms.Padding(24);
            this.panelContent.Size = new System.Drawing.Size(853, 538);
            this.panelContent.TabIndex = 2;
            // 
            // lblHeading
            // 
            this.lblHeading.AutoSize = true;
            this.lblHeading.Font = new System.Drawing.Font("Segoe UI", 18F);
            this.lblHeading.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(34)))), ((int)(((byte)(34)))), ((int)(((byte)(34)))));
            this.lblHeading.Location = new System.Drawing.Point(0, 8);
            this.lblHeading.Name = "lblHeading";
            this.lblHeading.Size = new System.Drawing.Size(227, 32);
            this.lblHeading.TabIndex = 0;
            this.lblHeading.Text = "Listado de Maestros";
            // 
            // dgvMaestros
            // 
            this.dgvMaestros.AllowUserToAddRows = false;
            this.dgvMaestros.AllowUserToDeleteRows = false;
            this.dgvMaestros.Anchor = ((System.Windows.Forms.AnchorStyles)(((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.dgvMaestros.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill;
            this.dgvMaestros.BackgroundColor = System.Drawing.Color.White;
            this.dgvMaestros.BorderStyle = System.Windows.Forms.BorderStyle.None;
            this.dgvMaestros.CellBorderStyle = System.Windows.Forms.DataGridViewCellBorderStyle.SingleHorizontal;
            dataGridViewCellStyle1.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleLeft;
            dataGridViewCellStyle1.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(33)))), ((int)(((byte)(37)))), ((int)(((byte)(41)))));
            dataGridViewCellStyle1.Font = new System.Drawing.Font("Segoe UI", 9F);
            dataGridViewCellStyle1.ForeColor = System.Drawing.Color.White;
            dataGridViewCellStyle1.Padding = new System.Windows.Forms.Padding(8, 0, 0, 0);
            this.dgvMaestros.ColumnHeadersDefaultCellStyle = dataGridViewCellStyle1;
            this.dgvMaestros.ColumnHeadersHeight = 42;
            this.dgvMaestros.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.Maestro,
            this.Materia,
            this.Email});
            dataGridViewCellStyle2.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleLeft;
            dataGridViewCellStyle2.BackColor = System.Drawing.Color.White;
            dataGridViewCellStyle2.Font = new System.Drawing.Font("Segoe UI", 9F);
            dataGridViewCellStyle2.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(50)))), ((int)(((byte)(50)))), ((int)(((byte)(50)))));
            dataGridViewCellStyle2.Padding = new System.Windows.Forms.Padding(8, 4, 8, 4);
            dataGridViewCellStyle2.SelectionBackColor = System.Drawing.Color.FromArgb(((int)(((byte)(232)))), ((int)(((byte)(244)))), ((int)(((byte)(253)))));
            dataGridViewCellStyle2.SelectionForeColor = System.Drawing.Color.Black;
            dataGridViewCellStyle2.WrapMode = System.Windows.Forms.DataGridViewTriState.False;
            this.dgvMaestros.DefaultCellStyle = dataGridViewCellStyle2;
            this.dgvMaestros.EnableHeadersVisualStyles = false;
            this.dgvMaestros.GridColor = System.Drawing.Color.FromArgb(((int)(((byte)(230)))), ((int)(((byte)(230)))), ((int)(((byte)(230)))));
            this.dgvMaestros.Location = new System.Drawing.Point(0, 55);
            this.dgvMaestros.MultiSelect = false;
            this.dgvMaestros.Name = "dgvMaestros";
            this.dgvMaestros.ReadOnly = true;
            this.dgvMaestros.RowHeadersVisible = false;
            this.dgvMaestros.SelectionMode = System.Windows.Forms.DataGridViewSelectionMode.FullRowSelect;
            this.dgvMaestros.Size = new System.Drawing.Size(853, 327);
            this.dgvMaestros.TabIndex = 0;
            // 
            // Maestro
            // 
            this.Maestro.FillWeight = 33F;
            this.Maestro.HeaderText = "Maestro";
            this.Maestro.Name = "Maestro";
            this.Maestro.ReadOnly = true;
            // 
            // Materia
            // 
            this.Materia.FillWeight = 25F;
            this.Materia.HeaderText = "Materia";
            this.Materia.Name = "Materia";
            this.Materia.ReadOnly = true;
            // 
            // Email
            // 
            this.Email.FillWeight = 42F;
            this.Email.HeaderText = "Email";
            this.Email.Name = "Email";
            this.Email.ReadOnly = true;
            // 
            // panelFooter
            // 
            this.panelFooter.BackColor = System.Drawing.Color.White;
            this.panelFooter.Controls.Add(this.lblFooter);
            this.panelFooter.Dock = System.Windows.Forms.DockStyle.Bottom;
            this.panelFooter.Location = new System.Drawing.Point(220, 602);
            this.panelFooter.Name = "panelFooter";
            this.panelFooter.Padding = new System.Windows.Forms.Padding(0, 8, 0, 0);
            this.panelFooter.Size = new System.Drawing.Size(853, 48);
            this.panelFooter.TabIndex = 3;
            // 
            // lblFooter
            // 
            this.lblFooter.Dock = System.Windows.Forms.DockStyle.Fill;
            this.lblFooter.Font = new System.Drawing.Font("Segoe UI", 9F);
            this.lblFooter.ForeColor = System.Drawing.Color.FromArgb(((int)(((byte)(140)))), ((int)(((byte)(140)))), ((int)(((byte)(140)))));
            this.lblFooter.Location = new System.Drawing.Point(0, 8);
            this.lblFooter.Name = "lblFooter";
            this.lblFooter.Size = new System.Drawing.Size(853, 40);
            this.lblFooter.TabIndex = 0;
            this.lblFooter.Text = "© 2025 Centro Educacional Bautista. centro educacional bautista.";
            this.lblFooter.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;
            // 
            // Listado_Maestro
            // 
            this.BackColor = System.Drawing.Color.WhiteSmoke;
            this.ClientSize = new System.Drawing.Size(1073, 650);
            this.Controls.Add(this.panelContent);
            this.Controls.Add(this.panelFooter);
            this.Controls.Add(this.panelTop);
            this.Controls.Add(this.panelSidebar);
            this.Font = new System.Drawing.Font("Segoe UI", 9F);
            this.MinimumSize = new System.Drawing.Size(980, 520);
            this.Name = "Listado_Maestro";
            this.Text = "Listado de Maestros";
            this.panelSidebar.ResumeLayout(false);
            this.panelTop.ResumeLayout(false);
            this.panelTop.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.picUser)).EndInit();
            this.panelContent.ResumeLayout(false);
            this.panelContent.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dgvMaestros)).EndInit();
            this.panelFooter.ResumeLayout(false);
            this.ResumeLayout(false);

        }

        #endregion
    }
}