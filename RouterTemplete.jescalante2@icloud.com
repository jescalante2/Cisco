!
hostname {{ siteinfo.hostname }}
!
service password-encryption
!
no ip domain-lookup
!
interface GigabitEthernet0/1
 no shut
!
interface GigabitEthernet0/1.7
 encapsulation dot1Q 7
 ip address {{ siteinfo.vlan7 }}
!
interface GigabitEthernet0/1.9
 encapsulation dot1Q 9
 ip address {{ siteinfo.vlan9 }}
!
interface GigabitEthernet0/1.999
 encapsulation dot1Q 999
 ip address {{ siteinfo.vlan999 }}
!
line vty 0 4
 logging synchronous
!
banner login ^C
                                     .:+syyyyys+:.
                                  :smMMMMMMMMMMMMMms:
                               `oNMMMMMMMMMMMMMMMMMMMd:
                              :mMMMMMMMMMMMMMMMMMMMMMMMs
                             :NMMMMMMMMhsdMMMMMMMMMMMMMMy
                            `NMMMMMMMMh` `./shmNMMMMMMMMMo
                            oMMMMMMNh:        ``../sdMMMMM.
                            dMMNs+:.                `-yMMM+
                            NMM+                       oMMy
                            NMM:                       .MMh
                          -yNMM`                        NMmy-
                          dosMM  :oyyyo:.    `-+yhys/` `MMo+m
                          ys/MM`-:....://-  `//:-...-: .MM/od
                          /N.MM-                       :MM-d+
                           hhNM:                       /MNyd`
                           `sNM/                       +MNo`
                          .hMMMNs`     .-::--::-`    `sMMMMy.
                         `mMMMMMMd--:+hmMMMMMMMMds/:-dMMMMMMm.

                                     .:+oyyhyso+:.
^C
!
do cop r s
