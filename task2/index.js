// nroot(1 + cos((x π) / n) ^ 2,3) Sum(e^(2 / 3 - k) / sqrt(x^k + x^(2k - 1)), k, 1, n)

const solve = (x, n) => {
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
  const cosRes = Math.cos(x * Math.PI / n);
  return Math.exp(Math.log(1 + cosRes * cosRes) / 3) * sumRes;
}


// console.log(cos(1), cos(0), cos(0.5));
console.log(solve(0.5, 11));


let x = 0.6

