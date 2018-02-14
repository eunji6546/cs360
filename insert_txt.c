#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <unistd.h>

int main(void) {
	FILE *f;
	int a,b,c,d,e;
    char *t;
    printf("sival");

    
    t = "INSERT into R values (";
    
    

	f = fopen("./insert_txt.txt", "w");
    
    
    for (a=0; a<5; a++){
        for (b=0; b<5;b++){
            for (c=0; c<5; c++) {
                for(d=0; d<5; d++){
                    for (e=0; e<5; e++) {
                        /*
                         
                         write(f, t, strlen(t));
                         write (f, a, sizeof(char));
                         write(f, ',', sizeof(char));write (f, b, sizeof(int));
                         write(f, ',', sizeof(char));write (f, c, sizeof(int));
                         write(f, ',', sizeof(char));write (f, d, sizeof(int));
                         write(f, ',', sizeof(char));write (f, e, sizeof(int));
                         write(f, ')', sizeof(char));
                         write(f, '\n', sizeof(char));
                         
                         */
                        fprintf(f, "%c",*t);
                        printf("sival");
                        
                        //fprintf(f, "%d, %d, %d, %d, %d); \n",a,b,c,d,e);
                    }}}}}
    

    printf("sival");
    printf("%d", strlen(t));
    //write(f, t, strlen(t));
    fclose(f);
return 0; 

} 	
