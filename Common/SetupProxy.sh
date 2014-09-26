


#
# Setup the http_proxy and https_proxy iff they exist.
#
if [ -e /BlockWorks/Build/Common/https_proxy ]
then 
    export https_proxy=http://`cat /BlockWorks/Build/Common/https_proxy`
    #git config --global https.proxy $https_proxy
fi

if [ -e /BlockWorks/Build/Common/http_proxy ]
then
    export http_proxy=http://`cat /BlockWorks/Build/Common/http_proxy`
    #git config --global http.proxy $http_proxy
fi


#export https_proxy=http://st26:Homeowner3#@cameurisa01.europe.root.pri:8080
#export http_proxy=http://st26:Homeowner3#@cameurisa01.europe.root.pri:8080
#git config --global --unset http.proxy
#git config --global --unset https.proxy


