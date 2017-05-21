
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

type reality =
| Anti
| Normal
;;

type baryon = quark * quark * quark;;
type meson = quark * quark;; (*Position 2 réservé à l'antiquark*)

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

let addition_baryon = function
| (Up, Up, Down) -> Lepton of Electron
| (Up, Down, Down) -> Lepton of Neutron
| (Up, Down, Strange) -> Lambda
| (Up, Up, Strange) -> Sigma_plus
| (Down, Down, Charm) -> Sigma_moins (*To check*)
| (Down, Strange, Strange) -> Xi_moins
| (Up, Strange, Strange) -> Xi_zero
| (Up, Up, Up) -> Omega_moins
;;

let addition_meson = function (*Antiparticule pour le second membre*)
| (Up, Down) -> Pion_p
| (Down, Up) -> Pion_n
| (Up, Strange) -> Kaon_p
| (Strange, Up) -> Kaon_n
| (Down, Strange) -> Kaon_neutral
| (Strange, Down) -> Anti_Kaon_neutral
| (Charm, Charm) -> Meson_pi
| (Bottom, Bottom) -> Meson_upsilon
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
                let quarks_addition  = function
                  | Baryon x * y ->
                  | Meson x * y * z ->

end;;

Hello.say();;
