   M S B A M L   `   `   `  ����_  [Fractional Deriavative Approximation, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null[2clr-namespace:Fractional_Deriavative_Approximation$Fractional_Deriavative_Approximation  5   	   C ?WpfMath, Version=0.11.0.0, Culture=neutral, PublicKeyToken=nullD/clr-namespace:WpfMath.Controls;assembly=WpfMathWpfMath.Controls 5   	   W SOpenTK.GLControl, Version=3.1.0.0, Culture=neutral, PublicKeyToken=bad199fe84eb3df49.clr-namespace:OpenTK;assembly=OpenTK.GLControlOpenTK 5   	   5    /Fractional_Deriavative_Approximation.MainWindow   5   	   W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35^ ZWindowsFormsIntegration, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   Dlocal2clr-namespace:Fractional_Deriavative_Approximation     5   	   Dcontrols/clr-namespace:WpfMath.Controls;assembly=WpfMath     5   	   Aopentk.clr-namespace:OpenTK;assembly=OpenTK.GLControl     5   	     � Title$  
MainWindow��5
   	   $��770.432��6   $��1092.5��6-   .��5      � 
�������$��0,0,0,-1q�6"    � RowDefinitions 5   
   �� 5      $
��673* �6   �� 5      $	��17* �6    � ColumnDefinitions 5   
   �� 5      $
��394* �6   �� 5      $
��681* �6   �� 5      $��9* �6   .+�5   
   %  WpfMath.Controls.FormulaControl     Formula$ \alpha:��6"   $
��Left=�5   &   $��16(�5   &   $��
14,314,0,0q�5   &   $	��Top=�5   &   $��12��5   &   $��51��62     5   
   $ f\left(t\right):��6"   $
��Left=�5   &   $��16(�5    &   $��
10,340,0,0q�5!   &   $	��Top=�5"   &   $��22��5#   &   $��51��62     5%   
   $ y\left(t\right):��6"   $
��Left=�5&   &   $��16(�5'   &   $��
10,370,0,0q�5(   &   $	��Top=�5)   &   $��22��5*   &   $��51��62     5,   
   $ \tau:��6"   $
��Left=�5-   &   $��16(�5.   &   $��
10,407,0,0q�5/   &   $	��Top=�50   &   $��12��51   &   $��51��62     53   
   $ n:��6"   $
��Left=�54   &   $��16(�55   &   $��
10,438,0,0q�56   &   $	��Top=�57   &   $��12��58   &   $��51��62     5:   
   $ m:��6"   $
��Left=�5;   &   $��16(�5<   &   $��
10,469,0,0q�5=   &   $	��Top=�5>   &   $��12��5?   &   $��51��62   �� 5A   
   -   5         ��Name$ TBox_Function��5A      $
��Left=�5B      $��16(�5C      $��25��5D      $��
72,337,0,0q�5E       �� TextWrapping$
 Wrap=�5F      $	��Top=�5G      $	��120��5H      $��4*t^(3/2)/(3*sqrt(pi))��6   �� 5J   
   -   5        $ 
TBox_Alpha��5K      $
��Left=�5J      $��16(�5L      $��25��5M      $��
72,304,0,0q�5N      $
 Wrap=�5O      $	��Top=�5P      $	��120��5Q      $	��0,5��6   �� 5S   
   $
��Left=�5T      $��
14,234,0,0q�5U      $	��Top=�5V      $��61��5W      $	��178��6   .��5X        $j dt\in\left[0, \tau\right] \\                                               \alpha\in\left(0, 1\right)��6&   $��62��5Z   &   $��86��62   5[      �� 5]   
   $
��Left=�5^      $��	14,10,0,0q�5_      $	��Top=�5`      ��. $��Visible=�5b      $	��224��5c      $	��370��6   .��5d        $� �y^{\left( \alpha \right)} \left( t \right)                                               = \frac{1}{\Gamma\left(1-\alpha\right)}                                               \int_0^t\frac{y\left(s\right)}                                               {\left(t-s\right)^{\alpha}}\,ds =                                                f\left(t\right)\\                                               f\left(t\right)\approx\sum^{m}_{k=0} {a_kt^{k+1-\alpha}}\\                                               y\left(t\right)\approx\sum^{m}_{k=0} {b_kt^{k}}��6&   $	��214��5k   &   $	��360��5l   &   5m      �� 5o   
   -   5        $ TBox_Tau��5o      $��16(�5p      $
��Left=�5q      $��26��5r      $��
72,397,0,0q�5s      $
 Wrap=�5t      $��5��5u      $	��Top=�5v      $	��120��5w      �� 5y   
   
���   �$��1q�5z      $
��Left=�5{      $	��600��5|      $��	10,10,0,0q�5}      $	��Top=�5~      $	��661��5      $��1��6   ._�5�      7  1System.Windows.Forms.Integration.WindowsFormsHost  $��9q�6      Child. 5�        OpenTK.GLControl  -   5        	glControl��5�   #   5�      5�      �� 5�   
   -   5         ��Name$ Button_Approximate��5�      $��Approximate��5�      $
��Left=�5�      $��
10,597,0,0q�5�      $	��Top=�5�      $	��133��5�      $��66��6   �� 5�   
   -   5        $ Button_Draw��5�      $
��Draw��5�      $
��Left=�5�      $��148,597,0,0q�5�      $	��Top=�5�      $	��133��5�      $��66��6   5�      �� 5�   
   -   5        $ TBox_n��5�      $��16(�5�      $
��Left=�5�      $��26��5�      $��
72,428,0,0q�5�      $
 Wrap=�5�      $	��100��5�      $	��Top=�5�      $	��120��5�      �� 5�   
   -   5        $ TBox_m��5�      $��16(�5�      $
��Left=�5�      $��26��5�      $��
72,459,0,0q�5�      $
 Wrap=�5�      $��5��5�      $	��Top=�5�      $	��120��5�      �� 5�   
   -	   5        $ 
TBox_Solve��5�      $
��Left=�5�      $��16(�5�      $��25��5�      $��
72,367,0,0q�5�      $
 Wrap=�5�      $	��Top=�5�      $	��120��5�      $��t��6   �� 5�   
   -
   5         ��Name$ ScrollViewer_yInfo��5�      $
��Left=�5�      $	��100��5�      $��
10,492,0,0q�5�      $	��Top=�5�      $	��374��5�      �� 5�   
   $
��Left=�5�      $��197,459,0,0q�5�      $	��Top=�5�      $��26��6(   $��67��64   .��5�        $ m \le n��6&   $��26��5�   &   $��57��5�   &   5�      �� 5�   
   -   5        	 ��Name$	 CheckBox_Solve��5�      $
��Left=�5�      $��196,365,0,0q�5�      $	��Top=�5�      $��15��6+   $��17��67   
 � LayoutTransform
 5�      �� 5�       �� ScaleX$ 2Q�6!    �� ScaleY$ 2Q�6,   5�      �� 5�   
   $��Left:��6   $��1��5�      $
��Left=�5�      $��
11,619,0,0q�5�      $��16(�5�      $	��Top=�5�      �� 5�   
   -   5        $ TextBox_Left��5�      $��1��5�      $
��Left=�5�      $��23��5�      $��
82,622,0,0q�5�      $��16(�5�      $
 Wrap=�5�      $	��Top=�5�      $��98��5�      �� 5�   
   $��Bottom:��6   $��1��5�      $
��Left=�5�      $��
11,647,0,0q�5�      $��16(�5�      $	��Top=�5�      �� 5�   
   -   5        $ TextBox_Bottom��5�      $��1��5�      $
��Left=�5�      $��23��5�      $��
82,650,0,0q�5�      $��16(�5�      $
 Wrap=�5�      $	��Top=�5�      $��98��5�      �� 5�   
   $��Right:��6   $��1��5�      $
��Left=�5�      $��220,619,0,0q�5�      $��16(�5�      $	��Top=�5�      �� 5�   
   -   5        $ TextBox_Right��5�      $��1��5�      $
��Left=�5�      $��23��5�      $��273,622,0,0q�5�      $
 Wrap=�5�      $��16(�5�      $	��Top=�5�      $��98��5�      �� 5�   
   $
��Top:��6   $��1��5�      $
��Left=�5�      $��220,647,0,0q�5�      $��16(�5�      $	��Top=�5      �� 5  
   -   5        $ TextBox_Top��5     $��1��5     $
��Left=�5     $��23��5     $��273,650,0,0q�5     $
 Wrap=�5     $	��Top=�5     $��16(�5     $��98��5	     5     5     