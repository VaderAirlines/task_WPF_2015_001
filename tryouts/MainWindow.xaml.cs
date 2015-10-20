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
using System.Reflection;

namespace WpfApplication1 {
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window {
        public MainWindow() {
            InitializeComponent();
        }

        private void generateComponents(object sender, RoutedEventArgs e) {
            var bob = new Person(Brushes.Black) { Name = "Bob", Age = 34, Checked = false, windowToOpen = "test.xaml" };
            var sally = new Person(Brushes.Blue) { Name = "Sally", Age = 28, Checked = true, windowToOpen = "test.xaml" };
            var joe = new Person(Brushes.Black) { Name = "Joe", Age = 44, Checked = false, windowToOpen="test.xaml" };

            joe.Subordinates.Add(bob);
            sally.Subordinates.Add(joe);

            trvTreeview.Items.Add(bob);
            trvTreeview.Items.Add(sally);

            mnuMenu.Items.Add(bob);
            mnuMenu.Items.Add(sally);
        }

        private void openNewWindow(object sender, RoutedEventArgs e)
        {
            e.Handled = true;
            MenuItem item = (MenuItem)sender;

            Window windowToOpen = (Window)Application.LoadComponent(new Uri(item.Tag.ToString(), UriKind.Relative));
            SetProperty(windowToOpen, "buttonText", item.Header);

            windowToOpen.Show();
        }

        private void SetProperty(object target, string propertyName, object value)
        {
            PropertyInfo property = target.GetType().GetProperty(propertyName);
            property.SetValue(target, value, null);
        }
    }

    public class Person {
        public Person(Brush color) {
            Subordinates = new List<Person>();
            Color = color;
        }

        public string Name { get; set; }
        public int Age { get; set; }
        public bool Checked { get; set; }
        public string TooltipText { get { return "test"; } }
        public Brush Color { get; set; }
        public string windowToOpen { get; set; }

        public List<Person> Subordinates { get; private set; }
    }
}