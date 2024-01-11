fun square (i: Int?) = i?.let{it*it}

fun main (args: Array<String>){
    args.forEach {
        println(square(it.toIntOrNull()) ?: "Ganzezahlen, bitte!")
    }
    if (args.isEmpty())
        println("Mindestens eine Zahl eingeben")


   fun test1(){
        print("Test")
    }

   fun test2(){
        test1()
    }

   fun fussball(){
        test2()
    }


    fussball()


}