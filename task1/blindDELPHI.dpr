program SolveExpression;

{$APPTYPE CONSOLE}
// y(x, n) = pow(x, n) / (root(x, n) + (pow(x, n-1) / (root(x, n-2) + pow(x, n-3) / (root(x, n-3) + pow(x, n-4)))) .... / (root(x, 2) + pow(x, 1))
// y(x, 2) = pow(x, 2) /
// 		(root(x, 2) + pow(x, 1) /
// 		(root(x, 1) + pow(x, 0)) 

uses
  SysUtils;

function solution(x: Int, n: Int): Int;
var:
	powXS: Int;
	res: Double;
	cnt: Int;
begin
	if (x < 0) then
	begin
		WriteLn('x must be >= 0')
	end
	else
	begin

		else
		begin
			let powXS = x * x; 
			let res = powXS / (Exp(Ln(x) / 3) + 1);
			let cnt = 0;

			while (n - cnt >= 3) do
			begin
				cnt := cnt + 1;
				powXS := powXS * x;
				res := powXS / (Exp(Ln(x) / (cnt + 2)) + res)
			end
		end;
	end;


	Result := res;
end;


procedure main(n: Int);
var:
	n: Int;
	x: Double;
begin
	Read(n);
	if (n < 2) then
	begin
		WriteLn('cant be < 2')
	end
	else
	begin
		x := 0.5;
		while(x < 0.8 + x/1e6) do
		begin
			WriteLn(Format('n=%d    x=%d    y=%g', [n, x, solution(x, n)]));
			x := x + 0.05;
			x := x - x % 1;
		end;
	end;
	ReadLn;
end;

begin
	main;
end;

