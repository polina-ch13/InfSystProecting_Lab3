package ua.hpi.architectura.lab3;

public class Lab3 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Object obj = new Object();
		obj = "s";
		System.out.println(obj);
		System.out.print(123);
		System.out.println();
		
		try { 
			  
			// create a array of Integers 
            int[] i = new int[2]; 
  
            // try to add numbers to array 
            i[2] = 3; 
        } 
  
        catch (Exception e) { 
  
            // print stack trace 
             e.printStackTrace(System.out);
        } 
	}

}
