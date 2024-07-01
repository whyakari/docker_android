#!/bin/bash

CONFIG_FILE="arch/arm64/configs/vendor/moe_defconfig"

check_and_add_config() {
    CONFIG=$1
    if ! grep -q "^$CONFIG" "$CONFIG_FILE"; then
        echo "$CONFIG" >> "$CONFIG_FILE"
    fi
}

add_docker_configs() {
    CONFIGS=(
        "CONFIG_PROC_PID_CPUSET=y"
        "CONFIG_NET=y"
        "CONFIG_NETDEVICES=y"
        "CONFIG_NET_CORE=y"
        "CONFIG_INET=y"
        "CONFIG_IPV6=y"
        "CONFIG_NET_L3_MASTER_DEV=y"
        "CONFIG_NETFILTER=y"
        "CONFIG_NETFILTER_ADVANCED=y"
        "CONFIG_NF_CONNTRACK=y"
        "CONFIG_NETFILTER_XTABLES=y"
        "CONFIG_NF_CONNMARK_IPV4=y"
        "CONFIG_IP_NF_IPTABLES=y"
        "CONFIG_NF_NAT_MASQUERADE_IPV4=y"
        "CONFIG_IP_NF_NAT=y"
        "CONFIG_IP_NF_TARGET_NETMAP=y"
        "CONFIG_IP_NF_TARGET_REDIRECT=y"
        "CONFIG_NET_SCHED=y"
        "CONFIG_CGROUP_NET_PRIO=y"
        "CONFIG_CGROUP_NET_CLASSID=y"
        "CONFIG_MD=y"
        "CONFIG_TTY=y"
        "CONFIG_UNIX98_PTYS=y"
        "CONFIG_HUGETLBFS=y"
        "CONFIG_PERSISTENT_KEYRINGS=y"
        "CONFIG_ENCRYPTED_KEYS=y"
        "CONFIG_KEY_DH_OPERATIONS=y"
        "CONFIG_NAMESPACES=y"
        "CONFIG_NET_NS=y"
        "CONFIG_PID_NS=y"
        "CONFIG_IPC_NS=y"
        "CONFIG_UTS_NS=y"
        "CONFIG_CGROUPS=y"
        "CONFIG_CGROUP_CPUACCT=y"
        "CONFIG_CGROUP_DEVICE=y"
        "CONFIG_CGROUP_FREEZER=y"
        "CONFIG_CGROUP_SCHED=y"
        "CONFIG_CPUSETS=y"
        "CONFIG_MEMCG=y"
        "CONFIG_KEYS=y"
        "CONFIG_VETH=y"
        "CONFIG_BRIDGE=y"
        "CONFIG_BRIDGE_NETFILTER=y"
        "CONFIG_NF_NAT_IPV4=y"
        "CONFIG_IP_NF_FILTER=y"
        "CONFIG_IP_NF_TARGET_MASQUERADE=y"
        "CONFIG_NETFILTER_XT_MATCH_ADDRTYPE=y"
        "CONFIG_NETFILTER_XT_MATCH_CONNTRACK=y"
        "CONFIG_NF_NAT=y"
        "CONFIG_NF_NAT_NEEDED=y"
        "CONFIG_POSIX_MQUEUE=y"
        "CONFIG_USER_NS=y"
        "CONFIG_SECCOMP=y"
        "CONFIG_CGROUP_PIDS=y"
        "CONFIG_BLK_DEV_THROTTLING=y"
        "CONFIG_CFQ_GROUP_IOSCHED=y"
        "CONFIG_CGROUP_HUGETLB=y"
        "CONFIG_NET_CLS_CGROUP=y"
        "CONFIG_FAIR_GROUP_SCHED=y"
        "CONFIG_RT_GROUP_SCHED=y"
        "CONFIG_IP_VS=y"
        "CONFIG_IP_VS_PROTO_TCP=y"
        "CONFIG_IP_VS_PROTO_UDP=y"
        "CONFIG_IP_VS_NFCT=y"
        "CONFIG_VXLAN=y"
        "CONFIG_IPVLAN=y"
        "CONFIG_MACVLAN=y"
        "CONFIG_DUMMY=y"
        "CONFIG_DEVPTS_MULTIPLE_INSTANCES=y"
        "CONFIG_MEMCG_KMEM=y"
        "CONFIG_NETFILTER_XT_MATCH_IPVS=y"
        "CONFIG_IP_VS_RR=y"
        "CONFIG_SECURITY_APPARMOR=y"
        "CONFIG_BRIDGE_VLAN_FILTERING=y"
        "CONFIG_NETFILTER_XT_TARGET_CHECKSUM=y"
        "CONFIG_FHANDLE=y"
        "CONFIG_UNIX_DIAG=y"
        "CONFIG_PACKET_DIAG=y"
        "CONFIG_NETLINK_DIAG=y"
        "CONFIG_CHECKPOINT_RESTORE=y"
        "CONFIG_NETFILTER_XT_MATCH_CGROUP=y"
    )

    for CONFIG in "${CONFIGS[@]}"; do
        check_and_add_config "$CONFIG"
    done
}

add_docker_configs
