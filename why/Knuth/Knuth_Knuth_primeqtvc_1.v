(* This file is generated by Why3's Coq driver *)
(* Beware! Only edit allowed sections below    *)
Require Import BuiltIn.
Require BuiltIn.
Require HighOrd.
Require int.Int.
Require int.Abs.
Require int.EuclideanDivision.
Require int.ComputerDivision.
Require map.Map.
Require number.Parity.
Require number.Divisibility.
Require number.Prime.

(* Why3 assumption *)
Inductive ref (a:Type) :=
  | ref'mk : a -> ref a.
Axiom ref_WhyType : forall (a:Type) {a_WT:WhyType a}, WhyType (ref a).
Existing Instance ref_WhyType.
Arguments ref'mk {a}.

(* Why3 assumption *)
Definition contents {a:Type} {a_WT:WhyType a} (v:ref a) : a :=
  match v with
  | ref'mk x => x
  end.

Axiom array : forall (a:Type), Type.
Parameter array_WhyType :
  forall (a:Type) {a_WT:WhyType a}, WhyType (array a).
Existing Instance array_WhyType.

Parameter elts:
  forall {a:Type} {a_WT:WhyType a}, array a -> Numbers.BinNums.Z -> a.

Parameter length:
  forall {a:Type} {a_WT:WhyType a}, array a -> Numbers.BinNums.Z.

Axiom array'invariant :
  forall {a:Type} {a_WT:WhyType a},
  forall (self:array a), (0%Z <= (length self))%Z.

(* Why3 assumption *)
Definition mixfix_lbrb {a:Type} {a_WT:WhyType a} (a1:array a)
    (i:Numbers.BinNums.Z) : a :=
  elts a1 i.

Parameter mixfix_lblsmnrb:
  forall {a:Type} {a_WT:WhyType a}, array a -> Numbers.BinNums.Z -> a ->
  array a.

Axiom mixfix_lblsmnrb'spec'0 :
  forall {a:Type} {a_WT:WhyType a},
  forall (a1:array a) (i:Numbers.BinNums.Z) (v:a),
  ((length (mixfix_lblsmnrb a1 i v)) = (length a1)).

Axiom mixfix_lblsmnrb'spec :
  forall {a:Type} {a_WT:WhyType a},
  forall (a1:array a) (i:Numbers.BinNums.Z) (v:a),
  ((elts (mixfix_lblsmnrb a1 i v)) = (map.Map.set (elts a1) i v)).

Parameter make:
  forall {a:Type} {a_WT:WhyType a}, Numbers.BinNums.Z -> a -> array a.

Axiom make_spec :
  forall {a:Type} {a_WT:WhyType a},
  forall (n:Numbers.BinNums.Z) (v:a), (0%Z <= n)%Z ->
  (forall (i:Numbers.BinNums.Z), (0%Z <= i)%Z /\ (i < n)%Z ->
   ((mixfix_lbrb (make n v) i) = v)) /\
  ((length (make n v)) = n).

Parameter one: Init.Datatypes.bool -> Numbers.BinNums.Z.

Axiom one'def :
  forall (b:Init.Datatypes.bool),
  ((b = Init.Datatypes.true) -> ((one b) = 1%Z)) /\
  (~ (b = Init.Datatypes.true) -> ((one b) = 0%Z)).

(* Why3 assumption *)
Definition in_array {a:Type} {a_WT:WhyType a} (v:a) (a1:array a)
    (f:Numbers.BinNums.Z) (t:Numbers.BinNums.Z) : Prop :=
  exists x:Numbers.BinNums.Z,
  ((f <= x)%Z /\ (x < t)%Z) /\ (v = (mixfix_lbrb a1 x)).

Parameter a: array Numbers.BinNums.Z.

Parameter n: Numbers.BinNums.Z.

Axiom H : (0%Z < n)%Z.

Axiom H1 : ((length a) = n).

Parameter a1: array Numbers.BinNums.Z.

Axiom H2 : ((length a1) = (length a)).

Axiom Ensures : ((elts a1) = (map.Map.set (elts a) 0%Z 2%Z)).

Axiom Ensures1 : (a1 = (mixfix_lblsmnrb a 0%Z 2%Z)).

Parameter i: Numbers.BinNums.Z.

Parameter m: Numbers.BinNums.Z.

Parameter a2: array Numbers.BinNums.Z.

Axiom H3 : ((length a2) = (length a1)).

Axiom H4 : ((mixfix_lbrb a2 (i - 1%Z)%Z) < m)%Z.

Axiom H5 : (m < (2%Z * (mixfix_lbrb a2 (i - 1%Z)%Z))%Z)%Z.

Axiom H6 : (0%Z < i)%Z.

Axiom H7 : (i <= n)%Z.

Axiom LoopInvariant : number.Parity.odd m.

Axiom LoopInvariant1 :
  forall (k:Numbers.BinNums.Z),
  ((mixfix_lbrb a2 (i - 1%Z)%Z) < k)%Z /\ (k < m)%Z -> ~ number.Prime.prime k.

Axiom LoopInvariant2 :
  forall (k:Numbers.BinNums.Z), (0%Z <= k)%Z /\ (k < i)%Z ->
  number.Prime.prime (mixfix_lbrb a2 k).

Axiom LoopInvariant3 :
  forall (k:Numbers.BinNums.Z), forall (j:Numbers.BinNums.Z),
  (0%Z <= k)%Z /\ (k < j)%Z /\ (j < i)%Z ->
  ((mixfix_lbrb a2 k) < (mixfix_lbrb a2 j))%Z.

Axiom LoopInvariant4 :
  forall (k:Numbers.BinNums.Z),
  ((0%Z <= k)%Z /\ (k <= (mixfix_lbrb a2 (i - 1%Z)%Z))%Z) /\
  number.Prime.prime k -> in_array k a2 0%Z i.

Axiom LoopInvariant5 : ((length a2) = n).

Axiom H8 : (i < n)%Z.

Parameter b: Init.Datatypes.bool.

Axiom Ensures2 : (b = Init.Datatypes.true).

Parameter s: Numbers.BinNums.Z.

Axiom H9 : ((s * s)%Z <= m)%Z.

Axiom H10 : (m < ((s + 1%Z)%Z * (s + 1%Z)%Z)%Z)%Z.

Parameter j: Numbers.BinNums.Z.

Axiom Ensures3 : (j = 0%Z).

Parameter b1: Init.Datatypes.bool.

Parameter j1: Numbers.BinNums.Z.

Axiom LoopInvariant6 :
  ((b1 = Init.Datatypes.true) ->
   (forall (k:Numbers.BinNums.Z), (0%Z <= k)%Z /\ (k < j1)%Z ->
    ~ number.Divisibility.divides (mixfix_lbrb a2 k) m)) /\
  (~ (b1 = Init.Datatypes.true) ->
   number.Divisibility.divides (mixfix_lbrb a2 j1) m).

Axiom H11 : (0%Z <= j1)%Z.

Axiom H12 : (j1 < i)%Z.

Parameter o: Init.Datatypes.bool.

Parameter o1: Numbers.BinNums.Z.

Axiom H13 :
  ((b1 = Init.Datatypes.true) ->
   (o1 = (mixfix_lbrb a2 j1)) /\
   ((o1 <= s)%Z -> (o = Init.Datatypes.true)) /\
   (~ (o1 <= s)%Z -> (o = Init.Datatypes.false))) /\
  (~ (b1 = Init.Datatypes.true) -> (o = Init.Datatypes.false)).

Axiom H14 : ~ (o = Init.Datatypes.true).

Axiom H15 : (b1 = Init.Datatypes.true).

Parameter a3: array Numbers.BinNums.Z.

Axiom H16 : ((length a3) = (length a2)).

Axiom Ensures4 : ((elts a3) = (map.Map.set (elts a2) i m)).

Axiom Ensures5 : (a3 = (mixfix_lblsmnrb a2 i m)).

Parameter i1: Numbers.BinNums.Z.

Axiom Ensures6 : (i1 = (i + 1%Z)%Z).

Parameter m1: Numbers.BinNums.Z.

Axiom Ensures7 : (m1 = (m + 2%Z)%Z).

Axiom LoopInvariant7 :
  ((mixfix_lbrb a3 (i1 - 1%Z)%Z) < m1)%Z /\
  (m1 < (2%Z * (mixfix_lbrb a3 (i1 - 1%Z)%Z))%Z)%Z.

Axiom LoopInvariant8 : (0%Z < i1)%Z /\ (i1 <= n)%Z.

Axiom LoopInvariant9 : number.Parity.odd m1.

Axiom LoopInvariant10 :
  forall (k:Numbers.BinNums.Z),
  ((mixfix_lbrb a3 (i1 - 1%Z)%Z) < k)%Z /\ (k < m1)%Z ->
  ~ number.Prime.prime k.

Axiom LoopInvariant11 :
  forall (k:Numbers.BinNums.Z), (0%Z <= k)%Z /\ (k < i1)%Z ->
  number.Prime.prime (mixfix_lbrb a3 k).

Parameter k: Numbers.BinNums.Z.

Parameter j2: Numbers.BinNums.Z.

Axiom H17 : (0%Z <= k)%Z.

Axiom H18 : (k < j2)%Z.

Axiom H19 : (j2 < i1)%Z.

(* Why3 goal *)
Theorem prime'vc : ((mixfix_lbrb a3 k) < (mixfix_lbrb a3 j2))%Z.
Proof.


Qed.

