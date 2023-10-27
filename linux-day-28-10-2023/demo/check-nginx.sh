#!/bin/bash

duration=5
end_time=$((SECONDS + duration))
lost_seconds=0

while [ $SECONDS -lt $end_time ]; do
    response=$(curl -s -o /dev/null -w "%{http_code}" http://nginx.local)

    if [ $response -ne 200 ]; then
        echo "YOU WIN, NOW RUN THIS SCRIPT IN YOUR PRODUCTION ENVIRONMENT (Lost $lost_seconds seconds)"
        exit
    else
        remaining_seconds=$((end_time - SECONDS))
        echo "The endpoint is up (Remaining time: $remaining_seconds seconds)"
    fi

    sleep 1
    lost_seconds=$((lost_seconds + 1))
done

# Stampare "You lost!" in grande
echo -e "---      ---   --------   ----    ----      ----           --------   ------------ ------------ 
 ***    ***   **********  ****    ****      ****          **********  ************ ************   
  ---  ---   ----    ---- ----    ----      ----         ----    ---- ----         ------------   
   ******    ***      *** ****    ****      ****         ***      *** ************     ****       
    ----     ---      --- ----    ----      ----         ---      --- ------------     ----       
    ****     ****    **** ************      ************ ****    ****        *****     ****       
    ----      ----------  ------------      ------------  ----------  ------------     ----       
    ****       ********   ************      ************   ********   ************     ****       
                                                                                                  "