/* 랜덤 번호 생성 */
function rndNumber() {
	
	const date=new Date();
	const year=date.getFullYear();
	const month=String(date.getMonth()+1).padStart(2, "0");
	const day=String(date.getDate()).padStart(2, "0");
	
	let orderNum=year+month+day;
	
	for(let i=0;i<10;i++) {
		orderNum+=Math.floor(Math.random()*8);
	}
	
	return orderNum;
	
}