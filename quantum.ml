
type lepton =
  | Electron
  | Muon
  | Tau
  | Neutrino_e
  | Neutrio_mu
  | Neutrino_t
;;

type quark =
  | Up | Down
  | Charm | Strange
  | Top | Bottom
  ;;

type fermion =
  | Lepton of lepton
  | Quark of quark

type bosons =
  | Z
  | W
  | Photon
  | Gluon
  | Higgs
;;

type meson = quark * quark * quark;;
type hadron = quark * quark;; (*Position 2 réservé à l'antiquark*)

type hadron =
  | Baryon of baryon
  | Meson of meson
;;

let charge_lepton = function
  | Electron | Muon | Tau-> (-1.)
  | Neutrino_e | Neutrio_mu | Neutrino_t -> 0.
;;
let charge_quark = function
  | Up | Charm | Top -> (2. /. 3.)
  | Strange | Down | Bottom -> (-1. /. 3.)
;;

let masse_lepton = function
  | Electron -> 511
  | Muon -> 105700
  | Tau -> 1777000
  | Neutrino_e -> 0 (*Revoir*)
  | Neutrio_mu -> 170 (*Revoir*)
  | Neutrino_t -> 15500 (*Revoir*)
;;

let masse_quark = function
| Up -> 1500
| Charm -> 1160000
| Top -> 174100000
| Down -> 3500
| Strange -> 70000
| Bottom -> 4200000
;;




module Hello :
sig
  val charge : lepton -> float
  val doc : unit -> unit
  val masse : lepton -> int
end =
struct
                let doc () =
                        print_string "Package pour jouer avec les particules"
                ;;
                let charge = function
                  | Lepton x -> charge_lepton x
                  | Quark x -> charge_quark x
                ;;
                let masse = function
                  | Lepton x -> masse_lepton x
                  | Quark x -> masse_quark x
                ;;

end;;

Hello.say();;
