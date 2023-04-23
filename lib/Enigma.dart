class Engima
{
    Rotor rotor1 = Rotor([4, 10, 12, 5, 0, 3, 7, 6, 11, 25, 1, 8, 2, 16, 18, 24, 13, 19, 14, 17, 23, 22, 21, 20, 15, 9 ]);
    Rotor rotor2 = Rotor([1, 0, 14, 10, 9, 8, 23, 25, 5, 4, 3, 13, 18, 11, 2, 24, 17, 16, 12, 21, 22, 19, 20, 6, 15, 7 ]);
    Rotor rotor3 = Rotor([10, 9, 19, 23, 21, 25, 22, 17, 13, 1, 0, 14, 15, 8, 11, 12, 20, 7, 24, 2, 16, 4, 6, 3, 18, 5 ]);
    Rotor rotor4 = Rotor([4, 13, 6, 23, 24, 3, 15, 9, 25, 0, 5, 7 , 1, 17, 20, 22, 21, 2, 8, 11, 19, 18, 10, 14, 16, 12 ]);
    Rotor rotor5 = Rotor([25, 17, 14, 2, 12, 10, 11, 19, 22, 5, 21, 8, 0, 15, 16, 23, 4, 13, 24, 18, 6, 1, 20, 3, 7, 9 ]);
    List<String> alpha = [ "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z" ];
    List<int> reflector = [ 5, 2, 1, 20, 12, 0, 10, 15, 16, 18, 6, 13, 4, 11, 21, 7, 8, 25, 9, 24, 3, 14, 23, 22, 19, 17];
    int? numUsedRotors;

    Engima(int n)
    {
        numUsedRotors= n;
    }

/* Pulls positions for as many selected number of rotors
  void setPositions()
  {

  }
*/

    String scramble(String input)
    {
        String encrypted = "";
        String let = "";
        bool uppercase = false;
        int loc = 0;

        for(int i=0;i<input.length;i++)
        {
            //only runs scrambling if its a letter in case webdomain contains
            if(input[i].contains(RegExp(r'[a-z]')))
            {
                let = input[i];
                loc = alpha.lastIndexOf(let);

                if(numUsedRotors! >= 1)
                {
                    //finds the next pathway based on the index of the alphabet
                    loc = rotor1.getRotorAt(loc);
                }
                if(numUsedRotors! >=2)
                {
                    //uses previous location to locate desired pathway
                    loc = rotor2.getRotorAt(loc);
                }
                if(numUsedRotors! >= 3)
                {
                    //finds the next pathway based on the index of the alphabet
                    loc = rotor3.getRotorAt(loc);
                }
                if(numUsedRotors! >=4)
                {
                    //uses previous location to locate desired pathway
                    loc = rotor4.getRotorAt(loc);
                }
                if(numUsedRotors ==5)
                {
                    //uses previous location to locate desired pathway
                    loc = rotor5.getRotorAt(loc);
                }

                loc = reflector[loc];

                if(numUsedRotors ==5)
                {
                    //follows the pathways in reverse to spit out new letter
                    loc = rotor5.findLocation(loc);
                    loc = rotor4.findLocation(loc);
                    loc = rotor3.findLocation(loc);
                    loc = rotor2.findLocation(loc);
                    loc = rotor1.findLocation(loc);

                }
                else if(numUsedRotors ==4)
                {
                    //follows the pathways in reverse to spit out new letter
                    loc = rotor4.findLocation(loc);
                    loc = rotor3.findLocation(loc);
                    loc = rotor2.findLocation(loc);
                    loc = rotor1.findLocation(loc);

                }
                else if(numUsedRotors ==3)
                {
                    //follows the pathways in reverse to spit out new letter
                    loc = rotor3.findLocation(loc);
                    loc = rotor2.findLocation(loc);
                    loc = rotor1.findLocation(loc);

                }
                else if(numUsedRotors ==2)
                {
                    //follows the pathways in reverse to spit out new letter
                    loc = rotor2.findLocation(loc);
                    loc = rotor1.findLocation(loc);

                }
                else
                {
                    loc = rotor1.findLocation(loc);
                }


                let = alpha[loc];

                encrypted += let;

                Click();

            }//end of if

        }//end of for loop

        int sym = (input.length)%4;
        switch(sym)
        {
            case 0:
                {
                    encrypted += "!";
                }
                break;
            case 1:
                {
                    encrypted += "@";
                }
                break;
            case 2:
                {
                    encrypted += "$";
                }
                break;
            case 3:
                {
                    encrypted += "&";
                }
                break;
            default:
                {
                    encrypted += "_";
                }
                break;
        }//end of switch

        int numbers = pow(2,numUsedRotors)%(input.length);
        encrypted += numbers;
        return encrypted;

    }//end of scramble

    void Click()
    {
        int temp1 =rotor1.Rotate();
        if(numUsedRotors! >=1)
        {
            if(temp1==1)
            {
                int temp2 = rotor2.Rotate();
                if(numUsedRotors! >=2)
                {
                    if(temp2==1)
                    {
                        int temp3 = rotor3.Rotate();
                        if(numUsedRotors! >=3)
                        {
                            if(temp3==1)
                            {
                                int temp4 = rotor4.Rotate();
                                if(numUsedRotors! >=5)
                                {
                                    if(temp4==1)
                                    {
                                        int temp5 = rotor5.Rotate();
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }//end of if 1
    }

}//end of Enigma
//------------------------------------------------------------------
class Rotor
{
    List<int>? wheel;
    List<String> alpha = [ "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z" ];
    int position=0;

    Rotor(List<int> l)
    {
        wheel = l;
    }

    int getRotorAt(int p)
    {
        return wheel!.elementAt(p);
    }

    void setRotorAt(int loc, int val)
    {
        wheel![loc] = val;
    }

    void setRotation(int pos)
    {
        int temp = 0;
        for(int i=0;i<pos-1;i++)
        {
            for(int j=0;j<26;j++)
            {
                if(wheel!.elementAt(j)-1<0)
                {
                    wheel![j] = 25;
                }
                else
                {
                    wheel![j]=wheel![j]-1;
                }
            }
            temp = wheel!.elementAt(0);
            wheel!.removeAt(0);
            wheel!.add(temp);
        }
        position = pos;
    }//end of set rotation

    int Rotate()
    {
        position++;

        bool fullRotation = false;
        if(position>26)
        {
            position = 1;
            fullRotation = true;
        }

        for(int i=0;i<26;i++)
        {
            if(wheel!.elementAt(i)-1<0)
            {
                wheel![i] = 25;
            }
            else
            {
                wheel![i]=wheel![i]-1;
            }
        }

        int temp = wheel!.elementAt(0);
        wheel!.removeAt(0);
        wheel!.add(temp);

        if(fullRotation)
        {
            return 1;
        }
        return 0;

    }//end of Rotate

    int findLocation(int n)
    {
        int loc = 0;
        for(int i=0; i<26;i++)
        {
            if(wheel!.elementAt(i) == n)
            {
                loc = i;
            }
        }
        return loc;
    }

}//end of Rotor