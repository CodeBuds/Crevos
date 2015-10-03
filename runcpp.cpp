/*REASON WHY THERE ARE SO MANY COMMENTS IS BECAUSE I'M STILL REFINING THIS IN TESTING (this is working version though)*/
///home/chronos/user/Downloads
#include<cstdlib>
#include<iostream>
#include<unistd.h>
#include<errno.h>
#include<string.h>
#include<sys/types.h>
#include<dirent.h>
#include<stdio.h>
int main(int argc, char* argv[])
{
    if(argc == 1 || argc == 2)
    {
        std::cout<<"ERROR: runcpp.out needs <filename> and <filedirectory>" <<std::endl << "Example: runcpp.out filetorun.out /directory/it/is/foundin"<<std::endl;
        return 1;
    }
    bool isArguments = false;
    std::string filename;
    std::string filedirectory;
    std::string copyShellStatm;
    std::string binPath = "/usr/local/bin";
    std::string runScript;
    std::string rmScript;
    //char a[50];
    int error = 0;
    //char filename [50];
    //std::system("pwd");
    //getcwd(a, 50);
    //std::cout<<a;
    //if(chroot("$HOME") == -1) std::cout <<"ROOT FAILED" <<strerror(errno) <<std::endl;
    //std::cout <<"....."<<std::endl;
    //std::cout <<"Have argc " <<argc<<std::endl;
    /*
    while((error = getopt(argc, argv, "abc")) != -1)
    {
        switch(error)
        {
            case 'a':
                std::cout<<"This is why it works!"<<std::endl;
                std::cout<<"Arguments are allowed!"<<std::endl;
                isArguments = true;
                break;
            case 'b':
                std::cout<<"b was called"<<std::endl;
                break;
            case '?':
                if(optopt == 'x')
                  fprintf (stderr, "Option -%c requires an argument.\n", optopt);
                else if (isprint (optopt))
                  fprintf (stderr, "Unknown option `-%c'.\n", optopt);
                else
                  fprintf (stderr,
                           "Unknown option character `\\x%x'.\n",
                           optopt);
                return 1;
            default:
                exit (1);
        }
        std::cout<<"Began loop"<<std::endl;
        
    }
    */
    
    if(argc >= 3)
    {
        filename = argv[1];
        filedirectory = argv[2];
        
    }
    if(chdir(filedirectory.c_str()) == -1 && argc != 1)
    {
        std::cout <<"Couldn't switch directories! Perhaps an issue! "<<strerror(errno) <<std::endl;
        return 1;
    }
    copyShellStatm = "sudo cp " + filename + " " + binPath;
    std::system(copyShellStatm.c_str());
    if(chdir("/usr/local/bin") == -1) std::cout<<"It failed miserably!"<<strerror(errno)<<std::endl;
    runScript = filename;
    std::system(runScript.c_str());
    rmScript = "sudo rm " + filename;
    std::system(rmScript.c_str());
    //std::cin>>a;
    return 0;
}
