% ==========================================
% FACTS: player(Name, Role, Rating)
% Roles: batsman, bowler, all_rounder, wicket_keeper
% Rating: 0 se 100 tak player ki performance/skill
% ==========================================

player(babar_azam, batsman, 92).
player(fakhar_zaman, batsman, 82).
player(imam_ul_haq, batsman, 79).
player(mohammad_rizwan, wicket_keeper, 89).
player(shadab_khan, all_rounder, 81).
player(iftikhar_ahmed, all_rounder, 77).
player(imad_wasim, all_rounder, 80).
player(shaheen_afridi, bowler, 90).
player(naseem_shah, bowler, 86).
player(haris_rauf, bowler, 84).
player(hasan_ali, bowler, 76).


% ==========================================
% RULES
% ==========================================

% 1. Elite Player: Woh player jinki rating 85 ya us se zyada ho
elite_player(Player) :-
    player(Player, _, Rating),
    Rating >= 85.

% 2. Match Winner / Potential Captain: Batsman ya All-rounder jiski rating 80 se upar ho
potential_captain(Player) :-
    player(Player, Role, Rating),
    (Role = batsman ; Role = all_rounder),
    Rating >= 80.

% 3. Bowling Unit: Woh sab players jo bowler ya all-rounder hon
can_bowl(Player) :-
    player(Player, bowler, _).
can_bowl(Player) :-
    player(Player, all_rounder, _).

% 4. Batting Lineup: Woh sab players jo batsman, wicket-keeper ya all-rounder hon
can_bat(Player) :-
    player(Player, batsman, _).
can_bat(Player) :-
    player(Player, wicket_keeper, _).
can_bat(Player) :-
    player(Player, all_rounder, _).

% 5. Squad Filter by Role: Kisi bhi specific role ke players nikalne ke liye
get_players_by_role(Role, Player) :-
    player(Player, Role, _).