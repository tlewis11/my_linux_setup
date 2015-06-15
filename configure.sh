if [ -f ~/.vimrc ]; then
    read -p 'You already have a ~/.vimrc file. Would you like to overwrite?(y/n)' yn

    case $yn in 
        [Yy]* ) cp vimrc ~/.vimrc;;

       
        [Nn]* ) exit;; 
    esac 

fi
