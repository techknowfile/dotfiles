# export TERM="screen-256color"
if [ -e ${HOME}/anaconda3/etc/profile.d/conda.sh ]
then
	. ${HOME}/anaconda3/etc/profile.d/conda.sh
else
	echo "Anaconda not found"
fi
[ -f ${HOME}/.zgen/zgen.zsh ] && source "${HOME}/.zgen/zgen.zsh"
