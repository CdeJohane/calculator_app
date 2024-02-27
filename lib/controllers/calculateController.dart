class CalculateController{
  int total = 0;

  CalculateController(){
    total =0;
  }

  String getTotal(){
    return(total.toString());
  }

  String setTotal(int num){
    total = num;
    return getTotal();
  }

  String addNum(int secondNum){
    total = total + secondNum;
    return getTotal();
  }
  String subNum(int secondNum) {
    total = total - secondNum;
    return getTotal();
  }
  String mulNum(int secondNum) {
    total = total * secondNum;
    return getTotal();
  }
  String divNum(int secondNum) {
    total = total ~/ secondNum;
    return getTotal();
  }
  
}