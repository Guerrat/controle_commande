function out1 = clc_A(q1, q2, Lb1, Lb2, Mb1, Mb2, Ixb1, Iyb1, Izb1, Ixb2, Iyb2, Izb2, fm1, fm2, foutil, G)
  %CLC_A  Autogenerated by sympy
  %   Code generated with sympy 1.1.1
  %
  %   See http://www.sympy.org/ for more information.
  %
  %   This file is part of 'project'

  out1 = [Izb1 + Izb2 + Lb1.^2.*Mb1/4 + Mb2.*(2*Lb1.^2 + 2*Lb1.*Lb2.*cos(q2) ...
      + Lb2.^2/2)/2 , Izb2 + Mb2.*(Lb1.*Lb2.*cos(q2) + Lb2.^2/2)/2;...
      Izb2 + Mb2.*(Lb1.*Lb2.*cos(q2) + Lb2.^2/2)/2 , Izb2 + Lb2.^2.*Mb2/4];

end
