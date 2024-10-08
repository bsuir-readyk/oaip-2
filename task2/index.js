// nroot(1 + cos((x π) / n) ^ 2,3) Sum(e^(2 / 3 - k) / sqrt(x^k + x^(2k - 1)), k, 1, n)

const cos = (x) => {
  let cur = 1;
  let xn = x * x;
  let factn = 2;
  let cnt = 2;
  let res = cur;
  const E = 1 / 1e4;
  while (Math.abs(cur - xn / factn) > E) {
    cur = xn / factn;
    res += cnt % 2 === 0 ? -cur : cur;
    cnt++;
    xn *= x;
    factn *= cnt;
  }
  return res;
}

const solve = (n, x) => {
  if (x <= 0) { throw "[error]"; }

  let k = 1,
    xk = x,
    x2k1 = x,
    sumRes = 0;
  while (k <= n) {
    sumRes += Math.exp(2 / 3 - k) / Math.sqrt(xk + x2k1);
    xk *= x;
    x2k1 *= x * x;
    k++;
  }
  const cosRes = cos(x * Math.PI / n);
  return Math.exp(Math.log(1 + cosRes * cosRes) / 3) * sumRes;
}



console.log(cos(1), cos(0), cos(0.5));
// console.log(cos(0.5), Math.cos(0.5));
console.log(solve(11, 0.6));


