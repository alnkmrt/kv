using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace WpfApp2.Pages
{
    /// <summary>
    /// Логика взаимодействия для ManagerPage.xaml
    /// </summary>
    public partial class ManagerPage : Page
    {
        public ManagerPage()
        {
            InitializeComponent();
        }

        private void ExitB_Click(object sender, RoutedEventArgs e)
        {
            Application.Current.Shutdown();
        }

        private void AddClientB_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new AddOrChangeClientPage());
        }

        private void AddDogovor_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new AddOrChangeDogovorPage());
        }

        private void DogovorDG_MouseDoubleClick(object sender, MouseButtonEventArgs e)
        {
            
        }

        private void ClientDG_MouseDoubleClick(object sender, MouseButtonEventArgs e)
        {

        }
    }
}
