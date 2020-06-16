eval $(ssh-agent -s);
ssh-add ~/.ssh/id_rsa_hav4ik;

while true;
do
	ifconfig > netinfo.txt;
	DIFF=$(git diff netinfo.txt);
	if [ "$DIFF" != "" ];
	then
		git add netinfo.txt;
		git commit -m 'update';
		git push origin master;
		echo "Repository updated with netinfo.txt";
	else
		echo "Nothing has changed. Repeating after 1 hour... (WARNING: DO NOT CLOSE THIS!!!)";
	fi;
	
	sleep 3600s;
done
