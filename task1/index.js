// y(x, n) = pow(x, n) / (root(x, n) + (pow(x, n-1) / (root(x, n-2) + pow(x, n-3) / (root(x, n-3) + pow(x, n-4)))) .... / (root(x, 2) + pow(x, 1))
// y(x, 2) = pow(x, 2) /
// 		(root(x, 2) + pow(x, 1) /
// 		(root(x, 1) + pow(x, 0)) 

const root = (x, n) => {
	return Math.exp(Math.log(x) / n);
	// rewrite using Exp(Ln(x) / n);
	// return n === 0 ? 1 : Math.pow(x, 1/n); 
}

const solution = (x, n) => {
	if (x < 0) {
		throw new Error("n cant be < 2");
	}
	if (n < 2) {
		throw new Error("n cant be < 2");
	}

	let powXS = x * x; 
	let res = powXS / (root(x, 2) + 1);
	let cnt = 0;

	while (n - cnt >= 3) {
		cnt++;
		powXS = powXS * x;
		//false && cnt < 4 || n - cnt < 4 ?
		//	console.log(`res = pow(${x}, ${cnt + 2}) / (root(${x}, ${cnt + 2}) + ${res})`) : 
		//	null;
		res = powXS / (root(x, cnt + 2) + res);
	}

	return res;
}




const main = (n) => {
	let x = 0.5;
	const step = 0.05;
	const finish = 0.8;
	while(x < finish + x/1e6) {
		console.log(`n=${n}    x=${x}    y=${solution(x, n)}`);
		x += step;
		x = Math.floor(x * 100) / 100;
	}
	return "";
}


console.log(main(2), "\n\n\n");
console.log(main(3), "\n\n\n");
console.log(main(4), "\n\n\n");

/*
console.log(solution(2, 40), "\n\n\n");
console.log(solution(2, 100), "\n\n\n");
console.log(solution(100, 100), "\n\n\n");
*/

