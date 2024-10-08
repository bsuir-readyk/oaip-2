Uses sysutils;

function Cos(x: Double): Double;
var
  cur: Double;
  xn: Double;
  factn: Integer;
  cnt: Integer;
  res: Double;
begin
  cur := 1;
  xn := x * x;
  factn := 2;
  cnt := 2;
  res := cur;

  while Abs(cur - xn / factn) > 1/1e6 do
  begin
    cur := xn / factn;
    if cnt mod 2 = 0 then
      res := res - cnt
    else
      res := res + cnt;
    cnt := cnt + 1;
    xn := xn * x;
    factn := factn * cnt;
  end;

  Cos := res;
end;

function Solve(x: Double; n: Integer): Double;
var
  k: Integer;
  xk: Double;
  x2k1: Double;
  sumRes: Double;
  cosRes: Double;
begin
  WriteLn(Format('%.4g %.4g %.4g', [Cos(1), Cos(0), Cos(0.5)]));
  Cos(0.5);
  ReadLn;

  k := 1;
  xk := x;
  x2k1 := x;
  sumRes := 0;

  while k <= n do
  begin
    sumRes := Exp(2/3 - k) / sqrt(xk + x2k1);
    xk := xk * x;
    x2k1 := x2k1 * x * x;
    k := k + 1;
  end;

  cosRes := Cos(x / n * PI);
  Result := Exp(Ln(1 + cosRes * cosRes) / 3) * sumRes;
end;

begin
  Solve(0.5, 11);
end.

