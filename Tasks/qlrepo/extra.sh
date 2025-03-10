#!/usr/bin/env bash
## Mod: Build2021102V2
## 添加你需要重启自动执行的任意命令，比如 ql repo
## 安装node依赖使用 pnpm install -g xxx xxx（Build 20210728-002 及以上版本的 code.sh，可忽略）
## 安装python依赖使用 pip3 install xxx（Build 20210728-002 及以上版本的 code.sh，可忽略）

#------ 说明区 ------#
## 1. 拉取仓库
### （1）定时任务→添加定时→命令【ql extra】→定时规则【15 0-23/4 * * *】→运行
### （2）若运行过 1custom 一键脚本，点击运行即可
### （3）推荐配置：如下。自行在设置区填写编号
## 2. 安装依赖
### （1）默认不安装，因为 Build 20210728-002 及以上版本的 code.sh 自动检查修复依赖
### （2）若需要在此处使用，请在设置区设置
## 3. Ninja
### （1）默认启动并自动更新
### （2）⚠未修改容器映射的请勿运行，否则会出现青龙打不开或者设备死机等不良后果，映射参考 https://github.com/MoonBegonia/ninja#%E5%AE%B9%E5%99%A8%E5%86%85

#------ 设置区 ------#
## 1. 拉取仓库编号设置，默认 shufflewzc 仓库
CollectedRepo=(4) ##示例：CollectedRepo=(2 4 6)
OtherRepo=()      ##示例：OtherRepo=(1 3)
## 2. 是否安装依赖和安装依赖包的名称设置
dependencies="r" ##yes为全部安装，no为不安装，p为安装package，r为安装requirement
package_name="@types/node axios canvas crypto-js date-fns dotenv fs jsdom png-js require ts-md5 tslib typescript"
requirement_name="cryptography==3.2.1 json5 requests rsa"
## 3. Ninja 是否需要启动和更新设置
Ninja="on" ##up为更新，on为启动，down为不运行

#------ 编号区 ------#
: <<\EOF
一、集成仓库（Collected Repositories)
2-JDHelloWorld
3-he1pu
4-shufflewzc
6-Aaron-lv
7-yuannian1112
二、其他仓库（Other Repositories）
1-passerby-b
2-curtinlv
3-smiek2221
4-cdle
5-ZCY01
6-whyour/hundun
7-moposmall
8-Ariszy (Zhiyi-N)
9-photonmang
10-jiulan
12-star261
13-Wenmoux
14-Tsukasa007
15-ccwav
EOF

#------ 代码区 ------#
# 🌱拉取仓库
CR2() {
    ql repo https://github.com/JDHelloWorld/jd_scripts.git "jd_|jx_|getJDCookie" "activity|backUp|Coupon|enen|update|test" "^jd[^_]|USER|^TS|utils|notify|env|package|ken.js"
}
CR3() {
    ql repo https://github.com/he1pu/JDHelp.git "jd_|jx_|getJDCookie" "Coupon|update" "^jd[^_]|USER|^sign|^ZooFaker|utils"
}
CR4() {
    ql repo https://github.com/shufflewzc/faker2.git "jd_|jx_|gua_|jddj_|getJDCookie" "activity|backUp|Coupon|update" "^jd[^_]|USER|utils|function|^JS|^TS|^JDJRValidator_Pure|^ZooFaker|^sign|ql"
}
CR6() {
    ql repo https://github.com/Aaron-lv/sync.git "jd_|jx_|getJDCookie" "activity|backUp|Coupon" "^jd[^_]|USER|utils" "jd_scripts"
}
CR7() {
    ql repo https://github.com/yuannian1112/jd_scripts.git "jd_|jx_|getJDCookie" "activity|backUp" "^jd[^_]|USER|utils"
}
for i in "${CollectedRepo[@]}"; do
    CR"$i"
    sleep 10
done

OR1() {
    ql repo https://github.com/passerby-b/JDDJ.git "jddj_" "scf_test_event|jddj_fruit_code.js|jddj_getck.js|jd_|jddj_cookie"
}
OR2() {
    ql repo https://github.com/curtinlv/JD-Script.git "jd_"
}
OR3() {
    ql repo https://github.com/smiek2121/scripts.git "jd_|gua_" "" "^MovementFaker|^JDJRValidator|^ZooFaker|^sign|^cleancart"
}
OR4() {
    ql repo https://github.com/cdle/xdd.git "jd_" "disposable|expired|jdc"
}
OR5() {
    ql repo https://github.com/ZCY01/daily_scripts.git "jd_"
}
OR6() {
    ql repo https://github.com/whyour/hundun.git "quanx" "tokens|caiyun|didi|donate|fold|Env"
}
OR7() {
    ql repo https://github.com/moposmall/Script.git "Me"
}
OR8() {
    ql repo https://github.com/Ariszy/Private-Script.git "JD"
}
OR9() {
    ql repo https://github.com/photonmang/quantumultX.git "JDscripts"
}
OR10() {
    ql repo https://github.com/jiulan/platypus.git "jd_|jx_" "" "overdue" "main"
}
OR11() {
    ql repo https://github.com/panghu999/panghu.git "jd_"
}
OR12() {
    ql repo https://github.com/star261/jd.git "jd_|star" "" "code" "main"
}
OR13() {
    ql repo https://github.com/Wenmoux/scripts.git "other|jd" "" "" "wen"
}
OR14() {
    ql repo https://github.com/Tsukasa007/my_script.git "jd_|jx_" "jdCookie|USER_AGENTS|sendNotify|backup" "" "master"
}
OR15() {
    ql repo https://github.com/ccwav/QLScript2.git "jd_" "NoUsed" "ql|utils"
}
for i in "${OtherRepo[@]}"; do
    OR"$i"
    sleep 5
done

# 🍪Ninja
update_Ninja_normal() {
    cd /ql/ninja/backend && git checkout . && git pull
    pnpm install && pm2 start
    cp sendNotify.js /ql/scripts/sendNotify.js
}

check_Ninja_normal() {
    NOWTIME=$(date +%Y-%m-%d-%H-%M-%S)
    i=0
    while ((i <= 0)); do
        echo "扫描 Ninja 是否在线"
        if [ -z "$(pgrep -f ninja)" ]; then
            i=0
            echo "$NOWTIME"" 扫描结束！Ninja 掉线了不用担心马上重启！"
            cd /ql || exit
            pgrep -f ninja | xargs kill -9
            cd /ql/ninja/backend || exit
            pnpm install
            pm2 start
            if [ -n "$(pgrep -f Daemon)" ]; then
                i=1
                echo "$NOWTIME"" Ninja 重启完成！"
                curl "https://api.telegram.org/bot$TG_BOT_TOKEN/sendMessage?chat_id=$TG_USER_ID&text=Ninja 已重启完成"
            fi
        else
            i=1
            echo "$NOWTIME"" 扫描结束！Ninja 还在！"
        fi
    done
}

if [ "$Ninja" = "up" ]; then
    update_Ninja_normal &
elif [ "$Ninja" = "on" ]; then
    check_Ninja_normal
fi

# 📦依赖
# shellcheck disable=SC2015
install_packages_normal() {
    for i in "$@"; do
        case $i in
        canvas)
            cd /ql/scripts || exit
            if [[ $(npm ls "$i" | grep ERR) != "" ]]; then
                npm uninstall "$i"
            fi
            if [[ "$(npm ls "$i")" =~ (empty) ]]; then
                apk add --no-cache build-base g++ cairo-dev pango-dev giflib-dev && npm i "$i" --prefix /ql/scripts --build-from-source
            fi
            ;;
        *)
            if [[ "$(npm ls "$i")" =~ $i ]]; then
                npm uninstall "$i"
            elif [[ $(npm ls "$i" -g | grep ERR) != "" ]]; then
                npm uninstall "$i" -g
            fi
            if [[ "$(npm ls "$i" -g)" =~ (empty) ]]; then
                [[ $i = "typescript" ]] && npm i "$i" -g --force || npm i "$i" -g
            fi
            ;;
        esac
    done
}

install_packages_force() {
    for i in "$@"; do
        case $i in
        canvas)
            cd /ql/scripts || exit
            if [[ "$(npm ls "$i")" =~ $i && $(npm ls "$i" | grep ERR) != "" ]]; then
                npm uninstall "$i"
                rm -rf /ql/scripts/node_modules/"$i"
                rm -rf /usr/local/lib/node_modules/lodash/*
            fi
            if [[ "$(npm ls "$i")" =~ (empty) ]]; then
                apk add --no-cache build-base g++ cairo-dev pango-dev giflib-dev && npm i "$i" --prefix /ql/scripts --build-from-source --force
            fi
            ;;
        *)
            cd /ql/scripts || exit
            if [[ "$(npm ls "$i")" =~ $i ]]; then
                npm uninstall "$i"
                rm -rf /ql/scripts/node_modules/"$i"
                rm -rf /usr/local/lib/node_modules/lodash/*
            elif [[ "$(npm ls "$i" -g)" =~ $i && $(npm ls "$i" -g | grep ERR) != "" ]]; then
                npm uninstall "$i" -g
                rm -rf /ql/scripts/node_modules/"$i"
                rm -rf /usr/local/lib/node_modules/lodash/*
            fi
            if [[ "$(npm ls "$i" -g)" =~ (empty) ]]; then
                npm i "$i" -g --force
            fi
            ;;
        esac
    done
}

install_packages_all() {
    install_packages_normal "$package_name"
    for i in $package_name; do
        install_packages_force "$i"
    done
}

install_requirements() {
    for i in $requirement_name; do
        case $i in
        cryptography==3.2.1)
            cd /ql/scripts || exit
            if [[ "$(pip3 freeze)" =~ cryptography==3.2.1 ]]; then
                echo "cryptography==3.2.1 已安装"
            else
                apk add --no-cache gcc libffi-dev musl-dev openssl-dev python3-dev && pip3 install cryptography~=3.2.1
            fi
            ;;
        *)
            if [[ "$(pip3 freeze)" =~ $i ]]; then
                echo "$i 已安装"
            else
                pip3 install "$i"
            fi
            ;;
        esac
    done
}

case $dependencies in
yes)
    install_packages_all &
    install_requirements &
    ;;
p)
    install_packages_all &
    ;;
r)
    install_requirements &
    ;;
esac
