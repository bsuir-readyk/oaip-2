function Solve(n, x: Double): Double;
var
  k: Integer;
  xk: Double;
  x2k1: Double;
  sumRes: Double;
  cosRes: Double;
begin 
  k := 1;
  xk := x;
  x2k1 := x;
  sumRes := 0;

  while k <= n do
  begin
    sumRes += Exp(2 / 3 - k) / Sqrt(xk + x2k1);
    xk := xk * x;
    x2k1 := x2k1 * x * x;
    Inc(k);
  end;

  cosRes := Cos(x * Pi / n);
  Result := Exp(Ln(1 + cosRes * cosRes) / 3) * sumRes;
end;

function Cos(x: Double): Double;
var
  cur: Double;
  xn: Double;
  factn: Double;
  cnt: Integer;
  res: Double;
const
  E = 1 / 1e4;
begin
  cur := 1;
  xn := x * x;
  factn := 2;
  cnt := 2;
  res := cur;

  while Abs(cur - xn / factn) > E do
  begin
    cur := xn / factn;
    if cnt mod 2 = 0 then
      res := res - cur
    else
      res := res + cur;
    Inc(cnt);
    xn := xn * x;
    factn := factn * cnt;
  end;
  Result := res;
end;

var
  x: Integer;
  n: Integer;
begin
  Write('x: ');
  ReadLn(x);
  Write('n: ');
  ReadLn(n);

  if x <> 0 then
    WriteLn(Format('%f4', [Solve(x, n)]))
  else
    WriteLn('x should be != 0');
  ReadLn;
end.

