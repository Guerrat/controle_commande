function out1 = clc_jacobien_outil(q1, q2, Lb1, Lb2, Mb1, Mb2, Ixb1, Iyb1, Izb1, Ixb2, Iyb2, Izb2, fm1, fm2, foutil, G)
  %CLC_JACOBIEN_OUTIL  Autogenerated by sympy
  %   Code generated with sympy 1.1.1
  %
  %   See http://www.sympy.org/ for more information.
  %
  %   This file is part of 'project'

  out1 = [-Lb1.*sin(q1) - Lb2.*sin(q1 + q2) -Lb2.*sin(q1 + q2); Lb1.*cos(q1) + Lb2.*cos(q1 + q2) Lb2.*cos(q1 + q2); 0 0];

end
