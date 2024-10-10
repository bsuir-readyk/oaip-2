Uses sysutils;

var
  x: Double;
  n: Integer;

  k: Integer;
  xk: Double;
  x2k1: Double;
  sumRes: Double;
  cosRes: Double;
begin
  x := 0.6;

  while x <= 1.1 + 1/1e6 do
  begin
    sumRes := 0;
    n := 10;

    while n <= 15 do
    begin
      k := 1;
      xk := x;
      x2k1 := x;

      cosRes := Cos(x / n * PI);

      if n = 10 then
      begin
        while k <= n do
        begin
          sumRes := sumRes + Exp(2/3 - k) / sqrt(xk + x2k1);
          xk := xk * x;
          x2k1 := x2k1 * x * x;
          k := k + 1;
        end
      end
      else
      begin
        sumRes := sumRes + Exp(2/3 - n) / sqrt(xk + x2k1);
        xk := xk * x;
        x2k1 := x2k1 * x * x;
      end;
     
      WriteLn(Format('n=%d x=%.4g f=%.4g', [n, x, Exp(Ln(1 + cosRes * cosRes) / 3) * sumRes]));
      n := n + 1; 
    end;
    x := x + 0.25;
end;
end.

