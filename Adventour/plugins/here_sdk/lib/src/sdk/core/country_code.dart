// Copyright (c) 2018-2020 HERE Global B.V. and its affiliate(s).
// All rights reserved.
//
// This software and other materials contain proprietary information
// controlled by HERE and are protected by applicable copyright legislation.
// Any use and utilization of this software and other materials and
// disclosure to any third parties is conditional upon having a separate
// agreement with HERE for the access, use, utilization or disclosure of this
// software. In the absence of such agreement, the use of the software is not
// allowed.
//


import 'dart:ffi';
import 'package:ffi/ffi.dart';
import 'package:meta/meta.dart';

import 'package:here_sdk/src/_library_context.dart' as __lib;

/// This enum represents country codes in accordance with the ISO 3166-1 standard using alpha-3 codes.
enum CountryCode {
    /// Aruba
    abw,
    /// Afghanistan
    afg,
    /// Angola
    ago,
    /// Anguilla
    aia,
    /// ?land Islands
    ala,
    /// Albania
    alb,
    /// Andorra
    and,
    /// United Arab Emirates
    are,
    /// Argentina
    arg,
    /// Armenia
    arm,
    /// American Samoa
    asm,
    /// Antarctica
    ata,
    /// French Southern Territories
    atf,
    /// Antigua and Barbuda
    atg,
    /// Australia
    aus,
    /// Austria
    aut,
    /// Azerbaijan
    aze,
    /// Burundi
    bdi,
    /// Belgium
    bel,
    /// Benin
    ben,
    /// Bonaire, Sint Eustatius and Saba
    bes,
    /// Burkina Faso
    bfa,
    /// Bangladesh
    bgd,
    /// Bulgaria
    bgr,
    /// Bahrain
    bhr,
    /// Bahamas
    bhs,
    /// Bosnia and Herzegovina
    bih,
    /// Saint Barth?lemy
    blm,
    /// Belarus
    blr,
    /// Belize
    blz,
    /// Bermuda
    bmu,
    /// Bolivia (Plurinational State of)
    bol,
    /// Brazil
    bra,
    /// Barbados
    brb,
    /// Brunei Darussalam
    brn,
    /// Bhutan
    btn,
    /// Bouvet Island
    bvt,
    /// Botswana
    bwa,
    /// Central African Republic
    caf,
    /// Canada
    can,
    /// Cocos (Keeling) Islands
    cck,
    /// Switzerland
    che,
    /// Chile
    chl,
    /// China
    chn,
    /// C?te d'Ivoire
    civ,
    /// Cameroon
    cmr,
    /// Congo, Democratic Republic of the
    cod,
    /// Congo
    cog,
    /// Cook Islands
    cok,
    /// Colombia
    col,
    /// Comoros
    com,
    /// Cabo Verde
    cpv,
    /// Costa Rica
    cri,
    /// Cuba
    cub,
    /// Cura?ao
    cuw,
    /// Christmas Island
    cxr,
    /// Cayman Islands
    cym,
    /// Cyprus
    cyp,
    /// Czechia
    cze,
    /// Germany
    deu,
    /// Djibouti
    dji,
    /// Dominica
    dma,
    /// Denmark
    dnk,
    /// Dominican Republic
    dom,
    /// Algeria
    dza,
    /// Ecuador
    ecu,
    /// Egypt
    egy,
    /// Eritrea
    eri,
    /// Western Sahara
    esh,
    /// Spain
    esp,
    /// Estonia
    est,
    /// Ethiopia
    eth,
    /// Finland
    fin,
    /// Fiji
    fji,
    /// Falkland Islands (Malvinas)
    flk,
    /// France
    fra,
    /// Faroe Islands
    fro,
    /// Micronesia (Federated States of)
    fsm,
    /// Gabon
    gab,
    /// United Kingdom of Great Britain and Northern Ireland
    gbr,
    /// Georgia
    geo,
    /// Guernsey
    ggy,
    /// Ghana
    gha,
    /// Gibraltar
    gib,
    /// Guinea
    gin,
    /// Guadeloupe
    glp,
    /// Gambia
    gmb,
    /// Guinea-Bissau
    gnb,
    /// Equatorial Guinea
    gnq,
    /// Greece
    grc,
    /// Grenada
    grd,
    /// Greenland
    grl,
    /// Guatemala
    gtm,
    /// French Guiana
    guf,
    /// Guam
    gum,
    /// Guyana
    guy,
    /// Hong Kong
    hkg,
    /// Heard Island and McDonald Islands
    hmd,
    /// Honduras
    hnd,
    /// Croatia
    hrv,
    /// Haiti
    hti,
    /// Hungary
    hun,
    /// Indonesia
    idn,
    /// Isle of Man
    imn,
    /// India
    ind,
    /// British Indian Ocean Territory
    iot,
    /// Ireland
    irl,
    /// Iran (Islamic Republic of)
    irn,
    /// Iraq
    irq,
    /// Iceland
    isl,
    /// Israel
    isr,
    /// Italy
    ita,
    /// Jamaica
    jam,
    /// Jersey
    jey,
    /// Jordan
    jor,
    /// Japan
    jpn,
    /// Kazakhstan
    kaz,
    /// Kenya
    ken,
    /// Kyrgyzstan
    kgz,
    /// Cambodia
    khm,
    /// Kiribati
    kir,
    /// Saint Kitts and Nevis
    kna,
    /// Korea, Republic of
    kor,
    /// Kuwait
    kwt,
    /// Lao People's Democratic Republic
    lao,
    /// Lebanon
    lbn,
    /// Liberia
    lbr,
    /// Libya
    lby,
    /// Saint Lucia
    lca,
    /// Liechtenstein
    lie,
    /// Sri Lanka
    lka,
    /// Lesotho
    lso,
    /// Lithuania
    ltu,
    /// Luxembourg
    lux,
    /// Latvia
    lva,
    /// Macao
    mac,
    /// Saint Martin (French part)
    maf,
    /// Morocco
    mar,
    /// Monaco
    mco,
    /// Moldova, Republic of
    mda,
    /// Madagascar
    mdg,
    /// Maldives
    mdv,
    /// Mexico
    mex,
    /// Marshall Islands
    mhl,
    /// North Macedonia
    mkd,
    /// Mali
    mli,
    /// Malta
    mlt,
    /// Myanmar
    mmr,
    /// Montenegro
    mne,
    /// Mongolia
    mng,
    /// Northern Mariana Islands
    mnp,
    /// Mozambique
    moz,
    /// Mauritania
    mrt,
    /// Montserrat
    msr,
    /// Martinique
    mtq,
    /// Mauritius
    mus,
    /// Malawi
    mwi,
    /// Malaysia
    mys,
    /// Mayotte
    myt,
    /// Namibia
    nam,
    /// New Caledonia
    ncl,
    /// Niger
    ner,
    /// Norfolk Island
    nfk,
    /// Nigeria
    nga,
    /// Nicaragua
    nic,
    /// Niue
    niu,
    /// Netherlands
    nld,
    /// Norway
    nor,
    /// Nepal
    npl,
    /// Nauru
    nru,
    /// New Zealand
    nzl,
    /// Oman
    omn,
    /// Pakistan
    pak,
    /// Panama
    pan,
    /// Pitcairn
    pcn,
    /// Peru
    per,
    /// Philippines
    phl,
    /// Palau
    plw,
    /// Papua New Guinea
    png,
    /// Poland
    pol,
    /// Puerto Rico
    pri,
    /// Korea (Democratic People's Republic of)
    prk,
    /// Portugal
    prt,
    /// Paraguay
    pry,
    /// Palestine, State of
    pse,
    /// French Polynesia
    pyf,
    /// Qatar
    qat,
    /// R?union
    reu,
    /// Romania
    rou,
    /// Russian Federation
    rus,
    /// Rwanda
    rwa,
    /// Saudi Arabia
    sau,
    /// Sudan
    sdn,
    /// Senegal
    sen,
    /// Singapore
    sgp,
    /// South Georgia and the South Sandwich Islands
    sgs,
    /// Saint Helena, Ascension and Tristan da Cunha
    shn,
    /// Svalbard and Jan Mayen
    sjm,
    /// Solomon Islands
    slb,
    /// Sierra Leone
    sle,
    /// El Salvador
    slv,
    /// San Marino
    smr,
    /// Somalia
    som,
    /// Saint Pierre and Miquelon
    spm,
    /// Serbia
    srb,
    /// South Sudan
    ssd,
    /// Sao Tome and Principe
    stp,
    /// Suriname
    sur,
    /// Slovakia
    svk,
    /// Slovenia
    svn,
    /// Sweden
    swe,
    /// Eswatini
    swz,
    /// Sint Maarten (Dutch part)
    sxm,
    /// Seychelles
    syc,
    /// Syrian Arab Republic
    syr,
    /// Turks and Caicos Islands
    tca,
    /// Chad
    tcd,
    /// Togo
    tgo,
    /// Thailand
    tha,
    /// Tajikistan
    tjk,
    /// Tokelau
    tkl,
    /// Turkmenistan
    tkm,
    /// Timor-Leste
    tls,
    /// Tonga
    ton,
    /// Trinidad and Tobago
    tto,
    /// Tunisia
    tun,
    /// Turkey
    tur,
    /// Tuvalu
    tuv,
    /// Taiwan, Province of China
    twn,
    /// Tanzania, United Republic of
    tza,
    /// Uganda
    uga,
    /// Ukraine
    ukr,
    /// United States Minor Outlying Islands
    umi,
    /// Uruguay
    ury,
    /// United States of America
    usa,
    /// Uzbekistan
    uzb,
    /// Holy See
    vat,
    /// Saint Vincent and the Grenadines
    vct,
    /// Venezuela (Bolivarian Republic of)
    ven,
    /// Virgin Islands (British)
    vgb,
    /// Virgin Islands (U.S.)
    vir,
    /// Viet Nam
    vnm,
    /// Vanuatu
    vut,
    /// Wallis and Futuna
    wlf,
    /// Samoa
    wsm,
    /// Yemen
    yem,
    /// South Africa
    zaf,
    /// Zambia
    zmb,
    /// Zimbabwe
    zwe
}

// CountryCode "private" section, not exported.

int sdk_core_CountryCode_toFfi(CountryCode value) {
  switch (value) {
  case CountryCode.abw:
    return 0;
  break;
  case CountryCode.afg:
    return 1;
  break;
  case CountryCode.ago:
    return 2;
  break;
  case CountryCode.aia:
    return 3;
  break;
  case CountryCode.ala:
    return 4;
  break;
  case CountryCode.alb:
    return 5;
  break;
  case CountryCode.and:
    return 6;
  break;
  case CountryCode.are:
    return 7;
  break;
  case CountryCode.arg:
    return 8;
  break;
  case CountryCode.arm:
    return 9;
  break;
  case CountryCode.asm:
    return 10;
  break;
  case CountryCode.ata:
    return 11;
  break;
  case CountryCode.atf:
    return 12;
  break;
  case CountryCode.atg:
    return 13;
  break;
  case CountryCode.aus:
    return 14;
  break;
  case CountryCode.aut:
    return 15;
  break;
  case CountryCode.aze:
    return 16;
  break;
  case CountryCode.bdi:
    return 17;
  break;
  case CountryCode.bel:
    return 18;
  break;
  case CountryCode.ben:
    return 19;
  break;
  case CountryCode.bes:
    return 20;
  break;
  case CountryCode.bfa:
    return 21;
  break;
  case CountryCode.bgd:
    return 22;
  break;
  case CountryCode.bgr:
    return 23;
  break;
  case CountryCode.bhr:
    return 24;
  break;
  case CountryCode.bhs:
    return 25;
  break;
  case CountryCode.bih:
    return 26;
  break;
  case CountryCode.blm:
    return 27;
  break;
  case CountryCode.blr:
    return 28;
  break;
  case CountryCode.blz:
    return 29;
  break;
  case CountryCode.bmu:
    return 30;
  break;
  case CountryCode.bol:
    return 31;
  break;
  case CountryCode.bra:
    return 32;
  break;
  case CountryCode.brb:
    return 33;
  break;
  case CountryCode.brn:
    return 34;
  break;
  case CountryCode.btn:
    return 35;
  break;
  case CountryCode.bvt:
    return 36;
  break;
  case CountryCode.bwa:
    return 37;
  break;
  case CountryCode.caf:
    return 38;
  break;
  case CountryCode.can:
    return 39;
  break;
  case CountryCode.cck:
    return 40;
  break;
  case CountryCode.che:
    return 41;
  break;
  case CountryCode.chl:
    return 42;
  break;
  case CountryCode.chn:
    return 43;
  break;
  case CountryCode.civ:
    return 44;
  break;
  case CountryCode.cmr:
    return 45;
  break;
  case CountryCode.cod:
    return 46;
  break;
  case CountryCode.cog:
    return 47;
  break;
  case CountryCode.cok:
    return 48;
  break;
  case CountryCode.col:
    return 49;
  break;
  case CountryCode.com:
    return 50;
  break;
  case CountryCode.cpv:
    return 51;
  break;
  case CountryCode.cri:
    return 52;
  break;
  case CountryCode.cub:
    return 53;
  break;
  case CountryCode.cuw:
    return 54;
  break;
  case CountryCode.cxr:
    return 55;
  break;
  case CountryCode.cym:
    return 56;
  break;
  case CountryCode.cyp:
    return 57;
  break;
  case CountryCode.cze:
    return 58;
  break;
  case CountryCode.deu:
    return 59;
  break;
  case CountryCode.dji:
    return 60;
  break;
  case CountryCode.dma:
    return 61;
  break;
  case CountryCode.dnk:
    return 62;
  break;
  case CountryCode.dom:
    return 63;
  break;
  case CountryCode.dza:
    return 64;
  break;
  case CountryCode.ecu:
    return 65;
  break;
  case CountryCode.egy:
    return 66;
  break;
  case CountryCode.eri:
    return 67;
  break;
  case CountryCode.esh:
    return 68;
  break;
  case CountryCode.esp:
    return 69;
  break;
  case CountryCode.est:
    return 70;
  break;
  case CountryCode.eth:
    return 71;
  break;
  case CountryCode.fin:
    return 72;
  break;
  case CountryCode.fji:
    return 73;
  break;
  case CountryCode.flk:
    return 74;
  break;
  case CountryCode.fra:
    return 75;
  break;
  case CountryCode.fro:
    return 76;
  break;
  case CountryCode.fsm:
    return 77;
  break;
  case CountryCode.gab:
    return 78;
  break;
  case CountryCode.gbr:
    return 79;
  break;
  case CountryCode.geo:
    return 80;
  break;
  case CountryCode.ggy:
    return 81;
  break;
  case CountryCode.gha:
    return 82;
  break;
  case CountryCode.gib:
    return 83;
  break;
  case CountryCode.gin:
    return 84;
  break;
  case CountryCode.glp:
    return 85;
  break;
  case CountryCode.gmb:
    return 86;
  break;
  case CountryCode.gnb:
    return 87;
  break;
  case CountryCode.gnq:
    return 88;
  break;
  case CountryCode.grc:
    return 89;
  break;
  case CountryCode.grd:
    return 90;
  break;
  case CountryCode.grl:
    return 91;
  break;
  case CountryCode.gtm:
    return 92;
  break;
  case CountryCode.guf:
    return 93;
  break;
  case CountryCode.gum:
    return 94;
  break;
  case CountryCode.guy:
    return 95;
  break;
  case CountryCode.hkg:
    return 96;
  break;
  case CountryCode.hmd:
    return 97;
  break;
  case CountryCode.hnd:
    return 98;
  break;
  case CountryCode.hrv:
    return 99;
  break;
  case CountryCode.hti:
    return 100;
  break;
  case CountryCode.hun:
    return 101;
  break;
  case CountryCode.idn:
    return 102;
  break;
  case CountryCode.imn:
    return 103;
  break;
  case CountryCode.ind:
    return 104;
  break;
  case CountryCode.iot:
    return 105;
  break;
  case CountryCode.irl:
    return 106;
  break;
  case CountryCode.irn:
    return 107;
  break;
  case CountryCode.irq:
    return 108;
  break;
  case CountryCode.isl:
    return 109;
  break;
  case CountryCode.isr:
    return 110;
  break;
  case CountryCode.ita:
    return 111;
  break;
  case CountryCode.jam:
    return 112;
  break;
  case CountryCode.jey:
    return 113;
  break;
  case CountryCode.jor:
    return 114;
  break;
  case CountryCode.jpn:
    return 115;
  break;
  case CountryCode.kaz:
    return 116;
  break;
  case CountryCode.ken:
    return 117;
  break;
  case CountryCode.kgz:
    return 118;
  break;
  case CountryCode.khm:
    return 119;
  break;
  case CountryCode.kir:
    return 120;
  break;
  case CountryCode.kna:
    return 121;
  break;
  case CountryCode.kor:
    return 122;
  break;
  case CountryCode.kwt:
    return 123;
  break;
  case CountryCode.lao:
    return 124;
  break;
  case CountryCode.lbn:
    return 125;
  break;
  case CountryCode.lbr:
    return 126;
  break;
  case CountryCode.lby:
    return 127;
  break;
  case CountryCode.lca:
    return 128;
  break;
  case CountryCode.lie:
    return 129;
  break;
  case CountryCode.lka:
    return 130;
  break;
  case CountryCode.lso:
    return 131;
  break;
  case CountryCode.ltu:
    return 132;
  break;
  case CountryCode.lux:
    return 133;
  break;
  case CountryCode.lva:
    return 134;
  break;
  case CountryCode.mac:
    return 135;
  break;
  case CountryCode.maf:
    return 136;
  break;
  case CountryCode.mar:
    return 137;
  break;
  case CountryCode.mco:
    return 138;
  break;
  case CountryCode.mda:
    return 139;
  break;
  case CountryCode.mdg:
    return 140;
  break;
  case CountryCode.mdv:
    return 141;
  break;
  case CountryCode.mex:
    return 142;
  break;
  case CountryCode.mhl:
    return 143;
  break;
  case CountryCode.mkd:
    return 144;
  break;
  case CountryCode.mli:
    return 145;
  break;
  case CountryCode.mlt:
    return 146;
  break;
  case CountryCode.mmr:
    return 147;
  break;
  case CountryCode.mne:
    return 148;
  break;
  case CountryCode.mng:
    return 149;
  break;
  case CountryCode.mnp:
    return 150;
  break;
  case CountryCode.moz:
    return 151;
  break;
  case CountryCode.mrt:
    return 152;
  break;
  case CountryCode.msr:
    return 153;
  break;
  case CountryCode.mtq:
    return 154;
  break;
  case CountryCode.mus:
    return 155;
  break;
  case CountryCode.mwi:
    return 156;
  break;
  case CountryCode.mys:
    return 157;
  break;
  case CountryCode.myt:
    return 158;
  break;
  case CountryCode.nam:
    return 159;
  break;
  case CountryCode.ncl:
    return 160;
  break;
  case CountryCode.ner:
    return 161;
  break;
  case CountryCode.nfk:
    return 162;
  break;
  case CountryCode.nga:
    return 163;
  break;
  case CountryCode.nic:
    return 164;
  break;
  case CountryCode.niu:
    return 165;
  break;
  case CountryCode.nld:
    return 166;
  break;
  case CountryCode.nor:
    return 167;
  break;
  case CountryCode.npl:
    return 168;
  break;
  case CountryCode.nru:
    return 169;
  break;
  case CountryCode.nzl:
    return 170;
  break;
  case CountryCode.omn:
    return 171;
  break;
  case CountryCode.pak:
    return 172;
  break;
  case CountryCode.pan:
    return 173;
  break;
  case CountryCode.pcn:
    return 174;
  break;
  case CountryCode.per:
    return 175;
  break;
  case CountryCode.phl:
    return 176;
  break;
  case CountryCode.plw:
    return 177;
  break;
  case CountryCode.png:
    return 178;
  break;
  case CountryCode.pol:
    return 179;
  break;
  case CountryCode.pri:
    return 180;
  break;
  case CountryCode.prk:
    return 181;
  break;
  case CountryCode.prt:
    return 182;
  break;
  case CountryCode.pry:
    return 183;
  break;
  case CountryCode.pse:
    return 184;
  break;
  case CountryCode.pyf:
    return 185;
  break;
  case CountryCode.qat:
    return 186;
  break;
  case CountryCode.reu:
    return 187;
  break;
  case CountryCode.rou:
    return 188;
  break;
  case CountryCode.rus:
    return 189;
  break;
  case CountryCode.rwa:
    return 190;
  break;
  case CountryCode.sau:
    return 191;
  break;
  case CountryCode.sdn:
    return 192;
  break;
  case CountryCode.sen:
    return 193;
  break;
  case CountryCode.sgp:
    return 194;
  break;
  case CountryCode.sgs:
    return 195;
  break;
  case CountryCode.shn:
    return 196;
  break;
  case CountryCode.sjm:
    return 197;
  break;
  case CountryCode.slb:
    return 198;
  break;
  case CountryCode.sle:
    return 199;
  break;
  case CountryCode.slv:
    return 200;
  break;
  case CountryCode.smr:
    return 201;
  break;
  case CountryCode.som:
    return 202;
  break;
  case CountryCode.spm:
    return 203;
  break;
  case CountryCode.srb:
    return 204;
  break;
  case CountryCode.ssd:
    return 205;
  break;
  case CountryCode.stp:
    return 206;
  break;
  case CountryCode.sur:
    return 207;
  break;
  case CountryCode.svk:
    return 208;
  break;
  case CountryCode.svn:
    return 209;
  break;
  case CountryCode.swe:
    return 210;
  break;
  case CountryCode.swz:
    return 211;
  break;
  case CountryCode.sxm:
    return 212;
  break;
  case CountryCode.syc:
    return 213;
  break;
  case CountryCode.syr:
    return 214;
  break;
  case CountryCode.tca:
    return 215;
  break;
  case CountryCode.tcd:
    return 216;
  break;
  case CountryCode.tgo:
    return 217;
  break;
  case CountryCode.tha:
    return 218;
  break;
  case CountryCode.tjk:
    return 219;
  break;
  case CountryCode.tkl:
    return 220;
  break;
  case CountryCode.tkm:
    return 221;
  break;
  case CountryCode.tls:
    return 222;
  break;
  case CountryCode.ton:
    return 223;
  break;
  case CountryCode.tto:
    return 224;
  break;
  case CountryCode.tun:
    return 225;
  break;
  case CountryCode.tur:
    return 226;
  break;
  case CountryCode.tuv:
    return 227;
  break;
  case CountryCode.twn:
    return 228;
  break;
  case CountryCode.tza:
    return 229;
  break;
  case CountryCode.uga:
    return 230;
  break;
  case CountryCode.ukr:
    return 231;
  break;
  case CountryCode.umi:
    return 232;
  break;
  case CountryCode.ury:
    return 233;
  break;
  case CountryCode.usa:
    return 234;
  break;
  case CountryCode.uzb:
    return 235;
  break;
  case CountryCode.vat:
    return 236;
  break;
  case CountryCode.vct:
    return 237;
  break;
  case CountryCode.ven:
    return 238;
  break;
  case CountryCode.vgb:
    return 239;
  break;
  case CountryCode.vir:
    return 240;
  break;
  case CountryCode.vnm:
    return 241;
  break;
  case CountryCode.vut:
    return 242;
  break;
  case CountryCode.wlf:
    return 243;
  break;
  case CountryCode.wsm:
    return 244;
  break;
  case CountryCode.yem:
    return 245;
  break;
  case CountryCode.zaf:
    return 246;
  break;
  case CountryCode.zmb:
    return 247;
  break;
  case CountryCode.zwe:
    return 248;
  break;
  default:
    throw StateError("Invalid enum value $value for CountryCode enum.");
  }
}

CountryCode sdk_core_CountryCode_fromFfi(int handle) {
  switch (handle) {
  case 0:
    return CountryCode.abw;
  break;
  case 1:
    return CountryCode.afg;
  break;
  case 2:
    return CountryCode.ago;
  break;
  case 3:
    return CountryCode.aia;
  break;
  case 4:
    return CountryCode.ala;
  break;
  case 5:
    return CountryCode.alb;
  break;
  case 6:
    return CountryCode.and;
  break;
  case 7:
    return CountryCode.are;
  break;
  case 8:
    return CountryCode.arg;
  break;
  case 9:
    return CountryCode.arm;
  break;
  case 10:
    return CountryCode.asm;
  break;
  case 11:
    return CountryCode.ata;
  break;
  case 12:
    return CountryCode.atf;
  break;
  case 13:
    return CountryCode.atg;
  break;
  case 14:
    return CountryCode.aus;
  break;
  case 15:
    return CountryCode.aut;
  break;
  case 16:
    return CountryCode.aze;
  break;
  case 17:
    return CountryCode.bdi;
  break;
  case 18:
    return CountryCode.bel;
  break;
  case 19:
    return CountryCode.ben;
  break;
  case 20:
    return CountryCode.bes;
  break;
  case 21:
    return CountryCode.bfa;
  break;
  case 22:
    return CountryCode.bgd;
  break;
  case 23:
    return CountryCode.bgr;
  break;
  case 24:
    return CountryCode.bhr;
  break;
  case 25:
    return CountryCode.bhs;
  break;
  case 26:
    return CountryCode.bih;
  break;
  case 27:
    return CountryCode.blm;
  break;
  case 28:
    return CountryCode.blr;
  break;
  case 29:
    return CountryCode.blz;
  break;
  case 30:
    return CountryCode.bmu;
  break;
  case 31:
    return CountryCode.bol;
  break;
  case 32:
    return CountryCode.bra;
  break;
  case 33:
    return CountryCode.brb;
  break;
  case 34:
    return CountryCode.brn;
  break;
  case 35:
    return CountryCode.btn;
  break;
  case 36:
    return CountryCode.bvt;
  break;
  case 37:
    return CountryCode.bwa;
  break;
  case 38:
    return CountryCode.caf;
  break;
  case 39:
    return CountryCode.can;
  break;
  case 40:
    return CountryCode.cck;
  break;
  case 41:
    return CountryCode.che;
  break;
  case 42:
    return CountryCode.chl;
  break;
  case 43:
    return CountryCode.chn;
  break;
  case 44:
    return CountryCode.civ;
  break;
  case 45:
    return CountryCode.cmr;
  break;
  case 46:
    return CountryCode.cod;
  break;
  case 47:
    return CountryCode.cog;
  break;
  case 48:
    return CountryCode.cok;
  break;
  case 49:
    return CountryCode.col;
  break;
  case 50:
    return CountryCode.com;
  break;
  case 51:
    return CountryCode.cpv;
  break;
  case 52:
    return CountryCode.cri;
  break;
  case 53:
    return CountryCode.cub;
  break;
  case 54:
    return CountryCode.cuw;
  break;
  case 55:
    return CountryCode.cxr;
  break;
  case 56:
    return CountryCode.cym;
  break;
  case 57:
    return CountryCode.cyp;
  break;
  case 58:
    return CountryCode.cze;
  break;
  case 59:
    return CountryCode.deu;
  break;
  case 60:
    return CountryCode.dji;
  break;
  case 61:
    return CountryCode.dma;
  break;
  case 62:
    return CountryCode.dnk;
  break;
  case 63:
    return CountryCode.dom;
  break;
  case 64:
    return CountryCode.dza;
  break;
  case 65:
    return CountryCode.ecu;
  break;
  case 66:
    return CountryCode.egy;
  break;
  case 67:
    return CountryCode.eri;
  break;
  case 68:
    return CountryCode.esh;
  break;
  case 69:
    return CountryCode.esp;
  break;
  case 70:
    return CountryCode.est;
  break;
  case 71:
    return CountryCode.eth;
  break;
  case 72:
    return CountryCode.fin;
  break;
  case 73:
    return CountryCode.fji;
  break;
  case 74:
    return CountryCode.flk;
  break;
  case 75:
    return CountryCode.fra;
  break;
  case 76:
    return CountryCode.fro;
  break;
  case 77:
    return CountryCode.fsm;
  break;
  case 78:
    return CountryCode.gab;
  break;
  case 79:
    return CountryCode.gbr;
  break;
  case 80:
    return CountryCode.geo;
  break;
  case 81:
    return CountryCode.ggy;
  break;
  case 82:
    return CountryCode.gha;
  break;
  case 83:
    return CountryCode.gib;
  break;
  case 84:
    return CountryCode.gin;
  break;
  case 85:
    return CountryCode.glp;
  break;
  case 86:
    return CountryCode.gmb;
  break;
  case 87:
    return CountryCode.gnb;
  break;
  case 88:
    return CountryCode.gnq;
  break;
  case 89:
    return CountryCode.grc;
  break;
  case 90:
    return CountryCode.grd;
  break;
  case 91:
    return CountryCode.grl;
  break;
  case 92:
    return CountryCode.gtm;
  break;
  case 93:
    return CountryCode.guf;
  break;
  case 94:
    return CountryCode.gum;
  break;
  case 95:
    return CountryCode.guy;
  break;
  case 96:
    return CountryCode.hkg;
  break;
  case 97:
    return CountryCode.hmd;
  break;
  case 98:
    return CountryCode.hnd;
  break;
  case 99:
    return CountryCode.hrv;
  break;
  case 100:
    return CountryCode.hti;
  break;
  case 101:
    return CountryCode.hun;
  break;
  case 102:
    return CountryCode.idn;
  break;
  case 103:
    return CountryCode.imn;
  break;
  case 104:
    return CountryCode.ind;
  break;
  case 105:
    return CountryCode.iot;
  break;
  case 106:
    return CountryCode.irl;
  break;
  case 107:
    return CountryCode.irn;
  break;
  case 108:
    return CountryCode.irq;
  break;
  case 109:
    return CountryCode.isl;
  break;
  case 110:
    return CountryCode.isr;
  break;
  case 111:
    return CountryCode.ita;
  break;
  case 112:
    return CountryCode.jam;
  break;
  case 113:
    return CountryCode.jey;
  break;
  case 114:
    return CountryCode.jor;
  break;
  case 115:
    return CountryCode.jpn;
  break;
  case 116:
    return CountryCode.kaz;
  break;
  case 117:
    return CountryCode.ken;
  break;
  case 118:
    return CountryCode.kgz;
  break;
  case 119:
    return CountryCode.khm;
  break;
  case 120:
    return CountryCode.kir;
  break;
  case 121:
    return CountryCode.kna;
  break;
  case 122:
    return CountryCode.kor;
  break;
  case 123:
    return CountryCode.kwt;
  break;
  case 124:
    return CountryCode.lao;
  break;
  case 125:
    return CountryCode.lbn;
  break;
  case 126:
    return CountryCode.lbr;
  break;
  case 127:
    return CountryCode.lby;
  break;
  case 128:
    return CountryCode.lca;
  break;
  case 129:
    return CountryCode.lie;
  break;
  case 130:
    return CountryCode.lka;
  break;
  case 131:
    return CountryCode.lso;
  break;
  case 132:
    return CountryCode.ltu;
  break;
  case 133:
    return CountryCode.lux;
  break;
  case 134:
    return CountryCode.lva;
  break;
  case 135:
    return CountryCode.mac;
  break;
  case 136:
    return CountryCode.maf;
  break;
  case 137:
    return CountryCode.mar;
  break;
  case 138:
    return CountryCode.mco;
  break;
  case 139:
    return CountryCode.mda;
  break;
  case 140:
    return CountryCode.mdg;
  break;
  case 141:
    return CountryCode.mdv;
  break;
  case 142:
    return CountryCode.mex;
  break;
  case 143:
    return CountryCode.mhl;
  break;
  case 144:
    return CountryCode.mkd;
  break;
  case 145:
    return CountryCode.mli;
  break;
  case 146:
    return CountryCode.mlt;
  break;
  case 147:
    return CountryCode.mmr;
  break;
  case 148:
    return CountryCode.mne;
  break;
  case 149:
    return CountryCode.mng;
  break;
  case 150:
    return CountryCode.mnp;
  break;
  case 151:
    return CountryCode.moz;
  break;
  case 152:
    return CountryCode.mrt;
  break;
  case 153:
    return CountryCode.msr;
  break;
  case 154:
    return CountryCode.mtq;
  break;
  case 155:
    return CountryCode.mus;
  break;
  case 156:
    return CountryCode.mwi;
  break;
  case 157:
    return CountryCode.mys;
  break;
  case 158:
    return CountryCode.myt;
  break;
  case 159:
    return CountryCode.nam;
  break;
  case 160:
    return CountryCode.ncl;
  break;
  case 161:
    return CountryCode.ner;
  break;
  case 162:
    return CountryCode.nfk;
  break;
  case 163:
    return CountryCode.nga;
  break;
  case 164:
    return CountryCode.nic;
  break;
  case 165:
    return CountryCode.niu;
  break;
  case 166:
    return CountryCode.nld;
  break;
  case 167:
    return CountryCode.nor;
  break;
  case 168:
    return CountryCode.npl;
  break;
  case 169:
    return CountryCode.nru;
  break;
  case 170:
    return CountryCode.nzl;
  break;
  case 171:
    return CountryCode.omn;
  break;
  case 172:
    return CountryCode.pak;
  break;
  case 173:
    return CountryCode.pan;
  break;
  case 174:
    return CountryCode.pcn;
  break;
  case 175:
    return CountryCode.per;
  break;
  case 176:
    return CountryCode.phl;
  break;
  case 177:
    return CountryCode.plw;
  break;
  case 178:
    return CountryCode.png;
  break;
  case 179:
    return CountryCode.pol;
  break;
  case 180:
    return CountryCode.pri;
  break;
  case 181:
    return CountryCode.prk;
  break;
  case 182:
    return CountryCode.prt;
  break;
  case 183:
    return CountryCode.pry;
  break;
  case 184:
    return CountryCode.pse;
  break;
  case 185:
    return CountryCode.pyf;
  break;
  case 186:
    return CountryCode.qat;
  break;
  case 187:
    return CountryCode.reu;
  break;
  case 188:
    return CountryCode.rou;
  break;
  case 189:
    return CountryCode.rus;
  break;
  case 190:
    return CountryCode.rwa;
  break;
  case 191:
    return CountryCode.sau;
  break;
  case 192:
    return CountryCode.sdn;
  break;
  case 193:
    return CountryCode.sen;
  break;
  case 194:
    return CountryCode.sgp;
  break;
  case 195:
    return CountryCode.sgs;
  break;
  case 196:
    return CountryCode.shn;
  break;
  case 197:
    return CountryCode.sjm;
  break;
  case 198:
    return CountryCode.slb;
  break;
  case 199:
    return CountryCode.sle;
  break;
  case 200:
    return CountryCode.slv;
  break;
  case 201:
    return CountryCode.smr;
  break;
  case 202:
    return CountryCode.som;
  break;
  case 203:
    return CountryCode.spm;
  break;
  case 204:
    return CountryCode.srb;
  break;
  case 205:
    return CountryCode.ssd;
  break;
  case 206:
    return CountryCode.stp;
  break;
  case 207:
    return CountryCode.sur;
  break;
  case 208:
    return CountryCode.svk;
  break;
  case 209:
    return CountryCode.svn;
  break;
  case 210:
    return CountryCode.swe;
  break;
  case 211:
    return CountryCode.swz;
  break;
  case 212:
    return CountryCode.sxm;
  break;
  case 213:
    return CountryCode.syc;
  break;
  case 214:
    return CountryCode.syr;
  break;
  case 215:
    return CountryCode.tca;
  break;
  case 216:
    return CountryCode.tcd;
  break;
  case 217:
    return CountryCode.tgo;
  break;
  case 218:
    return CountryCode.tha;
  break;
  case 219:
    return CountryCode.tjk;
  break;
  case 220:
    return CountryCode.tkl;
  break;
  case 221:
    return CountryCode.tkm;
  break;
  case 222:
    return CountryCode.tls;
  break;
  case 223:
    return CountryCode.ton;
  break;
  case 224:
    return CountryCode.tto;
  break;
  case 225:
    return CountryCode.tun;
  break;
  case 226:
    return CountryCode.tur;
  break;
  case 227:
    return CountryCode.tuv;
  break;
  case 228:
    return CountryCode.twn;
  break;
  case 229:
    return CountryCode.tza;
  break;
  case 230:
    return CountryCode.uga;
  break;
  case 231:
    return CountryCode.ukr;
  break;
  case 232:
    return CountryCode.umi;
  break;
  case 233:
    return CountryCode.ury;
  break;
  case 234:
    return CountryCode.usa;
  break;
  case 235:
    return CountryCode.uzb;
  break;
  case 236:
    return CountryCode.vat;
  break;
  case 237:
    return CountryCode.vct;
  break;
  case 238:
    return CountryCode.ven;
  break;
  case 239:
    return CountryCode.vgb;
  break;
  case 240:
    return CountryCode.vir;
  break;
  case 241:
    return CountryCode.vnm;
  break;
  case 242:
    return CountryCode.vut;
  break;
  case 243:
    return CountryCode.wlf;
  break;
  case 244:
    return CountryCode.wsm;
  break;
  case 245:
    return CountryCode.yem;
  break;
  case 246:
    return CountryCode.zaf;
  break;
  case 247:
    return CountryCode.zmb;
  break;
  case 248:
    return CountryCode.zwe;
  break;
  default:
    throw StateError("Invalid numeric value $handle for CountryCode enum.");
  }
}

void sdk_core_CountryCode_releaseFfiHandle(int handle) {}

final _sdk_core_CountryCode_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_core_CountryCode_create_handle_nullable'));
final _sdk_core_CountryCode_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_core_CountryCode_release_handle_nullable'));
final _sdk_core_CountryCode_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_core_CountryCode_get_value_nullable'));

Pointer<Void> sdk_core_CountryCode_toFfi_nullable(CountryCode value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdk_core_CountryCode_toFfi(value);
  final result = _sdk_core_CountryCode_create_handle_nullable(_handle);
  sdk_core_CountryCode_releaseFfiHandle(_handle);
  return result;
}

CountryCode sdk_core_CountryCode_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdk_core_CountryCode_get_value_nullable(handle);
  final result = sdk_core_CountryCode_fromFfi(_handle);
  sdk_core_CountryCode_releaseFfiHandle(_handle);
  return result;
}

void sdk_core_CountryCode_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _sdk_core_CountryCode_release_handle_nullable(handle);

// End of CountryCode "private" section.

