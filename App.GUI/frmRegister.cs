using App.BusinessLogicLayer;
using App.DataTransferObject;
using System.Windows.Forms;

namespace App.GUI
{
    public partial class frmRegister : Form
    {
        public User user = new User();
        public UserBUS userBUS = new UserBUS();
        public frmRegister()
        {
            InitializeComponent();
        }

        private void txtSubmit_Click(object sender, System.EventArgs e)
        {

            if (txtName.Text != "" && txtPassword.Text != "")
            {
                user.Name = txtName.Text;
                user.Password = txtPassword.Text;
                int row = userBUS.Insert(user);
                if (row > 0)
                {
                    MessageBox.Show($"Insert user {user.Name} successful");
                    this.Close();
                }
            }
        }

        private void frmRegister_Load(object sender, System.EventArgs e)
        {

            dgvListUser.DataSource = userBUS.GetAll();
        }
    }
}
