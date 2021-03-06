#!/bin/bash


#if [[ ! $# == 0 ]];then
#	who
#fi

target=$1
#echo 'param number: '$#



function who {
	case $USER in
		root)
			echo 'You are root'
			;;
		xy2)
			echo 'You are xy2'
			;;
		*)
			echo 'You are guest'
	esac
}


function help {
	USAGE=$(
		cat <<- EOF
		Usage: target
		For example: [xy4|go|hop]"
		EOF
	)
	echo $USAGE
}


function login {
	case $target in
		xy4)
			echo 'Login xy4...'
			# xy4
			#ssh xy4@xy4-OptiPlex-9020
			ssh xy4@10.239.76.28
			;;
		go)
			echo 'Login go...'
			# go
			#ssh binyang@aospdev-go
			ssh binyang@10.239.93.186
            # i***l
			;;
		hop)
			echo 'Login hop...'
			# hop
			ssh binyang@aospdev-hop
			#ssh binyang@10.239.93.163
            # i***l
			;;
		deng)
			echo 'Login deng bin...'
			# deng
			ssh binly@aosp-dev
			# i***l
            # /store/bdeng/nougat-mr1-dev
			;;
        e5)
            ssh intel@10.239.85.74
            #ssh intel@e3s10-host4
            #ssh intel@e3s10-host4.sh.intel.com
            #12**56
            ;;
        dai)
            ssh root@10.239.85.182
            #12**56
            ;;
		-h)
			help
			;;
		*)
			echo 'Login target UNKNOWN, failed'
	esac
}



echo
#who
date

echo
login
