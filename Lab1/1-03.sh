#!bin/bash
echo ""
printf '\e[38;5;255mHello, bro.This is text menu... I guess. Choose an option below this msg to continue.\e[38;5;196m\n'
printf '\e[38;5;196m  _____________________________\n'
printf '\e[38;5;196m |\e[48;5;12m1. Start nano.               \e[48;5;0m|\n'
printf '\e[48;5;0m\e[38;5;196m |_____________________________|\n'
printf '\e[38;5;196m |\e[48;5;12m2. Start vi.                 \e[48;5;0m|\n'
printf '\e[48;5;0m\e[38;5;196m |_____________________________|\n'
printf '\e[38;5;196m |\e[48;5;12m3. Start ELinks.             \e[48;5;0m|\n'

printf '\e[48;5;0m\e[38;5;196m |_____________________________|\n'
printf '\e[38;5;196m |\e[48;5;12m4. Quit.                     \e[48;5;0m|\n'
printf '\e[48;5;0m\e[38;5;196m |_____________________________|\e[38;5;255m\n'

read command
case $command in
1)
#start nano
echo "starting nano..."
sleep 3s
echo "Uhhh... To slow... My bad, dude..."
sleep 3s
/usr/bin/nano
;;
2)
#start vi
echo "starting vi..."
sleep 3s
/usr/bin/vi
;;
3)
#start links
echo "Is it Google? Or may be Safari? Oh, this is ELinks..."
sleep 2s
echo "Bruh..."
sleep 2s
links
;;
4)
#quit?
echo "I think it was pointless started me and then exited immediately, wasn't it?"
exit
;;
esac
