CREATE OR REPLACE AND RESOLVE JAVA SOURCE NAMED SYSTEM."my/Sleep" AS package my;
import java.lang.Thread;

public class Sleep {
    public static void main(String []args) throws java.lang.InterruptedException {
        if (args != null && args.length>0) {
            int s = Integer.parseInt(args[0]);
            Thread.sleep(s*1000);
        } else
            Thread.sleep(1000);
        }
    }
/

CREATE OR REPLACE PROCEDURE WAITSECONDS (SECONDS IN VARCHAR2)
AS
   LANGUAGE JAVA
   NAME 'my.Sleep.main(java.lang.String [])';
END WAITSECONDS;
/

GRANT EXECUTE ON SYSTEM.WAITSECONDS TO BKUPADM;
CREATE PUBLIC SYNONYM WAITSECONDS FOR SYSTEM.WAITSECONDS;


      FUNCTION WAIT
         RETURN BOOLEAN
      IS
         LOOP_CNT   NUMBER;
         FLAG       UTL_FILE.FILE_TYPE;
         FLAG_OUT   VARCHAR2 (50);
      BEGIN
         FOR LOOP_CNT IN 1 .. NUMLOOP_CNT
         LOOP
            /* Create DEBUG procedure
	    DEBUG ('The loop count in the WAIT function is: ' || LOOP_CNT);
            DEBUG ('The flag file value in the WAIT function is: ' || FLAG_OUT);
	    */

	    /* Put logic in here or leave blank for just a wait */

	    /* Put if-then here
            IF SOMETHING = 'ready'
            THEN
               RETURN TRUE;
            ELSE
	    */
               waitSeconds (SLEEP_CNT);
            -- END IF;
         END LOOP;

         RETURN FALSE;
      END WAIT;


/* Use this in your procedure if you want to exit after time out
            IF NOT WAIT
            THEN
               EXIT;
            END IF;
*/
