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
using OpenTK.Graphics;
using OpenTK.Graphics.OpenGL;
using MathNet.Symbolics;
using MathNet.Numerics.Interpolation;
using MathNet.Numerics;
using MathLib.SolvingLinearSystem;
using WpfMath;
using WpfMath.Converters;
using static System.Math;

namespace Fractional_Deriavative_Approximation
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : System.Windows.Window
    {
        SymbolicExpression f = SymbolicExpression.Parse("0");
        SymbolicExpression s = SymbolicExpression.Parse("0");
        Dictionary<string, FloatingPoint> symbols = new Dictionary<string, FloatingPoint>();
        double[] x, y;
        int m, n;
        double alpha, tau;
        double[] a, b;
        double right, left, top, bottom;

        private void Button_Draw_Click(object sender, RoutedEventArgs e)
        {
            GL.Clear(ClearBufferMask.ColorBufferBit);
            GL.Viewport(0, 0, glControl.Width, glControl.Height);
            GL.MatrixMode(MatrixMode.Projection);
            GL.LoadIdentity();
            if (double.TryParse(TextBox_Bottom.Text, out bottom) && double.TryParse(TextBox_Top.Text, out top) &&
               double.TryParse(TextBox_Right.Text, out right) && double.TryParse(TextBox_Left.Text, out left) &&
               bottom < top && left < right)
            {
                GL.Ortho(left, right, bottom, top, 0, 1);
            }
            else
            {
                MessageBox.Show("Incorrect borders");
                return;
            }

            GL.Begin(PrimitiveType.Lines);
            GL.Color4(new Color4(1f, 1f, 1f, 1f));
            GL.Vertex2(left, 0);
            GL.Vertex2(right, 0);

            GL.Vertex2(0, top);
            GL.Vertex2(0, bottom);
            GL.End();
            double t = tau / n;

            try
            {
                GL.Begin(PrimitiveType.LineStrip);
                GL.Color4(new Color4(1f, 0, 0, 0));
                for (int i = 0; i <= n; i++)
                {
                    double tValue = 0;
                    for (int j = 0; j < b.Length; j++)
                    {
                        tValue += b[j] * Pow(t * i, j);
                    }
                    GL.Vertex2(t * i, tValue);
                }
                GL.End();
            }
            catch
            {
                return;
            }

            if (CheckBox_Solve.IsChecked == true)
            {
                try
                {
                    s = SymbolicExpression.Parse(TBox_Solve.Text);
                    GL.Begin(PrimitiveType.LineStrip);
                    GL.Color4(new Color4(0, 1f, 0, 0));
                    for (int i = 0; i <= n; i++)
                    {
                        symbols.Add("t", t * i);
                        GL.Vertex2(t * i, s.Evaluate(symbols).RealValue);
                        symbols.Clear();
                    }
                    GL.End();
                }
                catch
                {
                    MessageBox.Show("Incorrect function y(t)");
                    symbols.Clear();
                }
            }

            glControl.SwapBuffers();      
        }

        public MainWindow()
        {
            InitializeComponent();
            glControl.MakeCurrent();
            GL.ClearColor(new Color4(0, 0, 0, 0));
        }

        public static double[] Approximate(double[] x, double[] y, int m, double alpha)
        {
            int n = x.Length;
            double[,] S = new double[m + 1, m + 1];
            double[] t = new double[m + 1];
            for (int i = 0; i < m + 1; i++)
            {
                for (int j = 0; j < m + 1; j++)
                {
                    for (int k = 0; k < n; k++)
                    {
                        S[i, j] += Pow(x[k], i + j + 2 - 2 * alpha);
                    }
                }

                for (int j = 0; j < n; j++)
                {
                    t[i] += y[j] * Pow(x[j], i + 1 - alpha);
                }
            }

            return GaussMethod.Solve(S, t);
        }

        private void Button_Approximate_Click(object sender, RoutedEventArgs e)
        {
            if (int.TryParse(TBox_m.Text, out m) && int.TryParse(TBox_n.Text, out n) &&
               double.TryParse(TBox_Tau.Text, out tau) && double.TryParse(TBox_Alpha.Text, out alpha) &&
               alpha > 0 && alpha < 1)
            {
                try
                {
                    f = SymbolicExpression.Parse(TBox_Function.Text);
                    double gamma = SpecialFunctions.Gamma(alpha);
                    y = new double[n];
                    x = new double[n];
                    for (int i = 1; i <= n; i++)
                    {
                        x[i - 1] = tau / n * i;

                        symbols.Add("t", x[i - 1]);
                        y[i - 1] = f.Evaluate(symbols).RealValue;
                        symbols.Clear();
                    }

                    a = Approximate(x, y, m, alpha);
                    b = new double[a.Length];
                    string solve = "";
                    for (int i = 0; i < b.Length; i++)
                    {
                        double production = 1;
                        for(int j = 0; j <= i; j++)
                        {
                            production *= j + 1 - alpha;
                        }

                        b[i] = a[i] * gamma * production / SpecialFunctions.Factorial(i);

                        if (b[i] < 0)
                        {
                            solve += $"{b[i]} * t^({i})\n";
                        }
                        else if (b[i] > 0)
                        {
                            solve += $"+{b[i]} * t^({i})\n";
                        }
                    }
                    ScrollViewer_yInfo.Content = "y(t) = \n" + solve;

                    y = new double[n];
                    for (int i = 0; i < n; i++)
                    {
                        for (int j = 0; j < b.Length; j++)
                        {
                            y[i] += b[j] * Pow(x[i], j);
                        }
                    }
                    double xMax = x.Max();
                    double yMax = y.Max();
                    TextBox_Bottom.Text = (-yMax / 10).ToString();
                    TextBox_Top.Text = (yMax * 1.1).ToString();
                    TextBox_Right.Text = (xMax * 1.1).ToString();
                    TextBox_Left.Text = (-xMax / 10).ToString();
                }
                catch
                {
                    MessageBox.Show("Incorrect function f(t)");
                    symbols.Clear();
                }
            }
            else
            {
                MessageBox.Show("Incorrect values");
            }
        }
    }
}
