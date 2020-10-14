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

/// This enum represents language codes.
///
/// The basic naming pattern
/// consists of a 2-letter ISO 639-1 language code followed by a 2-letter ISO
/// 3166-1 country code. Some language codes consist only of a language code, i.e.
/// without a country code. When there is no ISO 639-1 language code, the related
/// ISO 639-2 or ISO 639-3 language code is used. In case the script is specified,
/// its ISO 15924 code is used.
enum LanguageCode {
    /// English (United States)
    enUs,
    /// Afrikaans
    afZa,
    /// Albanian
    sqAl,
    /// Amharic (Ethiopia)
    amEt,
    /// Arabic (Saudi Arabia)
    arSa,
    /// Armenian
    hyAm,
    /// Assamese (India)
    asIn,
    /// Azeri - Latin
    azLatnAz,
    /// Bangla (Bangladesh)
    bnBd,
    /// Bangla (India)
    bnIn,
    /// Basque
    euEs,
    /// Belarusian
    beBy,
    /// Bosnian - Latin
    bsLatnBa,
    /// Bulgarian
    bgBg,
    /// Catalan (Spain)
    caEs,
    /// Central Kurdish - Arabic
    kuArab,
    /// Chinese (Simplified China)
    zhCn,
    /// Chinese (Traditional Hong Kong)
    zhHk,
    /// Chinese (Traditional Taiwan)
    zhTw,
    /// Croatian
    hrHr,
    /// Czech
    csCz,
    /// Danish
    daDk,
    /// Dari - Arabic (Afghanistan)
    prsArabAf,
    /// Dutch
    nlNl,
    /// English (British)
    enGb,
    /// Estonian
    etEe,
    /// Farsi (Iran)
    faIr,
    /// Filipino
    filPh,
    /// Finnish
    fiFi,
    /// French
    frFr,
    /// French (Canada)
    frCa,
    /// Galician
    glEs,
    /// Georgian
    kaGe,
    /// German
    deDe,
    /// Greek
    elGr,
    /// Gujarati (India)
    guIn,
    /// Hausa - Latin (Nigeria)
    haLatnNg,
    /// Hebrew
    heIl,
    /// Hindi
    hiIn,
    /// Hungarian
    huHu,
    /// Icelandic
    isIs,
    /// Igbo - Latin (Nigera)
    igLatnNg,
    /// Indonesian (Bahasa)
    idId,
    /// Irish
    gaIe,
    /// IsiXhosa
    xh,
    /// IsiZulu (South Africa)
    zuZa,
    /// Italian
    itIt,
    /// Japanese
    jaJp,
    /// Kannada (India)
    knIn,
    /// Kazakh
    kkKz,
    /// Khmer (Cambodia)
    kmKh,
    /// K'iche' - Latin (Guatemala)
    qucLatnGt,
    /// Kinyarwanda (Rwanda)
    rwRw,
    /// KiSwahili
    sw,
    /// Konkani (India)
    kokIn,
    /// Korean
    koKr,
    /// Kyrgyz - Cyrillic
    kyCyrlKg,
    /// Latvian
    lvLv,
    /// Lithuanian
    ltLt,
    /// Luxembourgish
    lbLu,
    /// Macedonian
    mkMk,
    /// Malay (Bahasa)
    msMy,
    /// Malayalam (India)
    mlIn,
    /// Maltese  (Malta)
    mtMt,
    /// Maori - Latin (New Zealand)
    miLatnNz,
    /// Marathi (India)
    mrIn,
    /// Mongolian - Cyrillic
    mnCyrlMn,
    /// Nepali (Nepal)
    neNp,
    /// Norwegian (Bokma?l)
    nbNo,
    /// Norwegian (Nynorsk)
    nnNo,
    /// Odia (India)
    orIn,
    /// Polish
    plPl,
    /// Portuguese (Brazil)
    ptBr,
    /// Portuguese (Portugal)
    ptPt,
    /// Punjabi - Gurmukhi
    paGuru,
    /// Punjabi - Arabic
    paArab,
    /// Quechua - Latin (Peru)
    quLatnPe,
    /// Romanian
    roRo,
    /// Russian
    ruRu,
    /// Scottish Gaelic - Latin
    gdLatnGb,
    /// Serbian - Cyrillic (Bosnia)
    srCyrlBa,
    /// Serbian - Cyrillic (Serbia)
    srCyrlRs,
    /// Serbian - Latin (Serbia)
    srLatnRs,
    /// Sesotho Sa Leboa (South Africa)
    nsoZa,
    /// Setswana
    tn,
    /// Sindhi - Arabic
    sdArab,
    /// Sinhala (Sri Lanka)
    siLk,
    /// Slovak
    skSk,
    /// Slovenian
    slSi,
    /// Spanish (Mexico)
    esMx,
    /// Spanish (Spain)
    esEs,
    /// Swedish
    svSe,
    /// Tajik - Cyrillic
    tgCyrlTj,
    /// Tamil
    ta,
    /// Tatar - Cyrillic (Russia)
    ttCyrlRu,
    /// Telugu (India)
    teIn,
    /// Thai
    thTh,
    /// Tigrinya (Ethiopia)
    tiEt,
    /// Turkish
    trTr,
    /// Turkmen - Latin
    tkLatnTm,
    /// Ukrainian
    ukUa,
    /// Urdu
    ur,
    /// Uyghur - Arabic
    ugArab,
    /// Uzbek - Cyrillic
    uzCyrlUz,
    /// Uzbek - Latin
    uzLatnUz,
    /// Valencian (Spain)
    catEs,
    /// Vietnamese
    viVn,
    /// Welsh
    cyGb,
    /// Wolof - Latin
    woLatn,
    /// Yoruba - Latin
    yoLatn
}

// LanguageCode "private" section, not exported.

int sdk_core_LanguageCode_toFfi(LanguageCode value) {
  switch (value) {
  case LanguageCode.enUs:
    return 0;
  break;
  case LanguageCode.afZa:
    return 1;
  break;
  case LanguageCode.sqAl:
    return 2;
  break;
  case LanguageCode.amEt:
    return 3;
  break;
  case LanguageCode.arSa:
    return 4;
  break;
  case LanguageCode.hyAm:
    return 5;
  break;
  case LanguageCode.asIn:
    return 6;
  break;
  case LanguageCode.azLatnAz:
    return 7;
  break;
  case LanguageCode.bnBd:
    return 8;
  break;
  case LanguageCode.bnIn:
    return 9;
  break;
  case LanguageCode.euEs:
    return 10;
  break;
  case LanguageCode.beBy:
    return 11;
  break;
  case LanguageCode.bsLatnBa:
    return 12;
  break;
  case LanguageCode.bgBg:
    return 13;
  break;
  case LanguageCode.caEs:
    return 14;
  break;
  case LanguageCode.kuArab:
    return 15;
  break;
  case LanguageCode.zhCn:
    return 16;
  break;
  case LanguageCode.zhHk:
    return 17;
  break;
  case LanguageCode.zhTw:
    return 18;
  break;
  case LanguageCode.hrHr:
    return 19;
  break;
  case LanguageCode.csCz:
    return 20;
  break;
  case LanguageCode.daDk:
    return 21;
  break;
  case LanguageCode.prsArabAf:
    return 22;
  break;
  case LanguageCode.nlNl:
    return 23;
  break;
  case LanguageCode.enGb:
    return 24;
  break;
  case LanguageCode.etEe:
    return 25;
  break;
  case LanguageCode.faIr:
    return 26;
  break;
  case LanguageCode.filPh:
    return 27;
  break;
  case LanguageCode.fiFi:
    return 28;
  break;
  case LanguageCode.frFr:
    return 29;
  break;
  case LanguageCode.frCa:
    return 30;
  break;
  case LanguageCode.glEs:
    return 31;
  break;
  case LanguageCode.kaGe:
    return 32;
  break;
  case LanguageCode.deDe:
    return 33;
  break;
  case LanguageCode.elGr:
    return 34;
  break;
  case LanguageCode.guIn:
    return 35;
  break;
  case LanguageCode.haLatnNg:
    return 36;
  break;
  case LanguageCode.heIl:
    return 37;
  break;
  case LanguageCode.hiIn:
    return 38;
  break;
  case LanguageCode.huHu:
    return 39;
  break;
  case LanguageCode.isIs:
    return 40;
  break;
  case LanguageCode.igLatnNg:
    return 41;
  break;
  case LanguageCode.idId:
    return 42;
  break;
  case LanguageCode.gaIe:
    return 43;
  break;
  case LanguageCode.xh:
    return 44;
  break;
  case LanguageCode.zuZa:
    return 45;
  break;
  case LanguageCode.itIt:
    return 46;
  break;
  case LanguageCode.jaJp:
    return 47;
  break;
  case LanguageCode.knIn:
    return 48;
  break;
  case LanguageCode.kkKz:
    return 49;
  break;
  case LanguageCode.kmKh:
    return 50;
  break;
  case LanguageCode.qucLatnGt:
    return 51;
  break;
  case LanguageCode.rwRw:
    return 52;
  break;
  case LanguageCode.sw:
    return 53;
  break;
  case LanguageCode.kokIn:
    return 54;
  break;
  case LanguageCode.koKr:
    return 55;
  break;
  case LanguageCode.kyCyrlKg:
    return 56;
  break;
  case LanguageCode.lvLv:
    return 57;
  break;
  case LanguageCode.ltLt:
    return 58;
  break;
  case LanguageCode.lbLu:
    return 59;
  break;
  case LanguageCode.mkMk:
    return 60;
  break;
  case LanguageCode.msMy:
    return 61;
  break;
  case LanguageCode.mlIn:
    return 62;
  break;
  case LanguageCode.mtMt:
    return 63;
  break;
  case LanguageCode.miLatnNz:
    return 64;
  break;
  case LanguageCode.mrIn:
    return 65;
  break;
  case LanguageCode.mnCyrlMn:
    return 66;
  break;
  case LanguageCode.neNp:
    return 67;
  break;
  case LanguageCode.nbNo:
    return 68;
  break;
  case LanguageCode.nnNo:
    return 69;
  break;
  case LanguageCode.orIn:
    return 70;
  break;
  case LanguageCode.plPl:
    return 71;
  break;
  case LanguageCode.ptBr:
    return 72;
  break;
  case LanguageCode.ptPt:
    return 73;
  break;
  case LanguageCode.paGuru:
    return 74;
  break;
  case LanguageCode.paArab:
    return 75;
  break;
  case LanguageCode.quLatnPe:
    return 76;
  break;
  case LanguageCode.roRo:
    return 77;
  break;
  case LanguageCode.ruRu:
    return 78;
  break;
  case LanguageCode.gdLatnGb:
    return 79;
  break;
  case LanguageCode.srCyrlBa:
    return 80;
  break;
  case LanguageCode.srCyrlRs:
    return 81;
  break;
  case LanguageCode.srLatnRs:
    return 82;
  break;
  case LanguageCode.nsoZa:
    return 83;
  break;
  case LanguageCode.tn:
    return 84;
  break;
  case LanguageCode.sdArab:
    return 85;
  break;
  case LanguageCode.siLk:
    return 86;
  break;
  case LanguageCode.skSk:
    return 87;
  break;
  case LanguageCode.slSi:
    return 88;
  break;
  case LanguageCode.esMx:
    return 89;
  break;
  case LanguageCode.esEs:
    return 90;
  break;
  case LanguageCode.svSe:
    return 91;
  break;
  case LanguageCode.tgCyrlTj:
    return 92;
  break;
  case LanguageCode.ta:
    return 93;
  break;
  case LanguageCode.ttCyrlRu:
    return 94;
  break;
  case LanguageCode.teIn:
    return 95;
  break;
  case LanguageCode.thTh:
    return 96;
  break;
  case LanguageCode.tiEt:
    return 97;
  break;
  case LanguageCode.trTr:
    return 98;
  break;
  case LanguageCode.tkLatnTm:
    return 99;
  break;
  case LanguageCode.ukUa:
    return 100;
  break;
  case LanguageCode.ur:
    return 101;
  break;
  case LanguageCode.ugArab:
    return 102;
  break;
  case LanguageCode.uzCyrlUz:
    return 103;
  break;
  case LanguageCode.uzLatnUz:
    return 104;
  break;
  case LanguageCode.catEs:
    return 105;
  break;
  case LanguageCode.viVn:
    return 106;
  break;
  case LanguageCode.cyGb:
    return 107;
  break;
  case LanguageCode.woLatn:
    return 108;
  break;
  case LanguageCode.yoLatn:
    return 109;
  break;
  default:
    throw StateError("Invalid enum value $value for LanguageCode enum.");
  }
}

LanguageCode sdk_core_LanguageCode_fromFfi(int handle) {
  switch (handle) {
  case 0:
    return LanguageCode.enUs;
  break;
  case 1:
    return LanguageCode.afZa;
  break;
  case 2:
    return LanguageCode.sqAl;
  break;
  case 3:
    return LanguageCode.amEt;
  break;
  case 4:
    return LanguageCode.arSa;
  break;
  case 5:
    return LanguageCode.hyAm;
  break;
  case 6:
    return LanguageCode.asIn;
  break;
  case 7:
    return LanguageCode.azLatnAz;
  break;
  case 8:
    return LanguageCode.bnBd;
  break;
  case 9:
    return LanguageCode.bnIn;
  break;
  case 10:
    return LanguageCode.euEs;
  break;
  case 11:
    return LanguageCode.beBy;
  break;
  case 12:
    return LanguageCode.bsLatnBa;
  break;
  case 13:
    return LanguageCode.bgBg;
  break;
  case 14:
    return LanguageCode.caEs;
  break;
  case 15:
    return LanguageCode.kuArab;
  break;
  case 16:
    return LanguageCode.zhCn;
  break;
  case 17:
    return LanguageCode.zhHk;
  break;
  case 18:
    return LanguageCode.zhTw;
  break;
  case 19:
    return LanguageCode.hrHr;
  break;
  case 20:
    return LanguageCode.csCz;
  break;
  case 21:
    return LanguageCode.daDk;
  break;
  case 22:
    return LanguageCode.prsArabAf;
  break;
  case 23:
    return LanguageCode.nlNl;
  break;
  case 24:
    return LanguageCode.enGb;
  break;
  case 25:
    return LanguageCode.etEe;
  break;
  case 26:
    return LanguageCode.faIr;
  break;
  case 27:
    return LanguageCode.filPh;
  break;
  case 28:
    return LanguageCode.fiFi;
  break;
  case 29:
    return LanguageCode.frFr;
  break;
  case 30:
    return LanguageCode.frCa;
  break;
  case 31:
    return LanguageCode.glEs;
  break;
  case 32:
    return LanguageCode.kaGe;
  break;
  case 33:
    return LanguageCode.deDe;
  break;
  case 34:
    return LanguageCode.elGr;
  break;
  case 35:
    return LanguageCode.guIn;
  break;
  case 36:
    return LanguageCode.haLatnNg;
  break;
  case 37:
    return LanguageCode.heIl;
  break;
  case 38:
    return LanguageCode.hiIn;
  break;
  case 39:
    return LanguageCode.huHu;
  break;
  case 40:
    return LanguageCode.isIs;
  break;
  case 41:
    return LanguageCode.igLatnNg;
  break;
  case 42:
    return LanguageCode.idId;
  break;
  case 43:
    return LanguageCode.gaIe;
  break;
  case 44:
    return LanguageCode.xh;
  break;
  case 45:
    return LanguageCode.zuZa;
  break;
  case 46:
    return LanguageCode.itIt;
  break;
  case 47:
    return LanguageCode.jaJp;
  break;
  case 48:
    return LanguageCode.knIn;
  break;
  case 49:
    return LanguageCode.kkKz;
  break;
  case 50:
    return LanguageCode.kmKh;
  break;
  case 51:
    return LanguageCode.qucLatnGt;
  break;
  case 52:
    return LanguageCode.rwRw;
  break;
  case 53:
    return LanguageCode.sw;
  break;
  case 54:
    return LanguageCode.kokIn;
  break;
  case 55:
    return LanguageCode.koKr;
  break;
  case 56:
    return LanguageCode.kyCyrlKg;
  break;
  case 57:
    return LanguageCode.lvLv;
  break;
  case 58:
    return LanguageCode.ltLt;
  break;
  case 59:
    return LanguageCode.lbLu;
  break;
  case 60:
    return LanguageCode.mkMk;
  break;
  case 61:
    return LanguageCode.msMy;
  break;
  case 62:
    return LanguageCode.mlIn;
  break;
  case 63:
    return LanguageCode.mtMt;
  break;
  case 64:
    return LanguageCode.miLatnNz;
  break;
  case 65:
    return LanguageCode.mrIn;
  break;
  case 66:
    return LanguageCode.mnCyrlMn;
  break;
  case 67:
    return LanguageCode.neNp;
  break;
  case 68:
    return LanguageCode.nbNo;
  break;
  case 69:
    return LanguageCode.nnNo;
  break;
  case 70:
    return LanguageCode.orIn;
  break;
  case 71:
    return LanguageCode.plPl;
  break;
  case 72:
    return LanguageCode.ptBr;
  break;
  case 73:
    return LanguageCode.ptPt;
  break;
  case 74:
    return LanguageCode.paGuru;
  break;
  case 75:
    return LanguageCode.paArab;
  break;
  case 76:
    return LanguageCode.quLatnPe;
  break;
  case 77:
    return LanguageCode.roRo;
  break;
  case 78:
    return LanguageCode.ruRu;
  break;
  case 79:
    return LanguageCode.gdLatnGb;
  break;
  case 80:
    return LanguageCode.srCyrlBa;
  break;
  case 81:
    return LanguageCode.srCyrlRs;
  break;
  case 82:
    return LanguageCode.srLatnRs;
  break;
  case 83:
    return LanguageCode.nsoZa;
  break;
  case 84:
    return LanguageCode.tn;
  break;
  case 85:
    return LanguageCode.sdArab;
  break;
  case 86:
    return LanguageCode.siLk;
  break;
  case 87:
    return LanguageCode.skSk;
  break;
  case 88:
    return LanguageCode.slSi;
  break;
  case 89:
    return LanguageCode.esMx;
  break;
  case 90:
    return LanguageCode.esEs;
  break;
  case 91:
    return LanguageCode.svSe;
  break;
  case 92:
    return LanguageCode.tgCyrlTj;
  break;
  case 93:
    return LanguageCode.ta;
  break;
  case 94:
    return LanguageCode.ttCyrlRu;
  break;
  case 95:
    return LanguageCode.teIn;
  break;
  case 96:
    return LanguageCode.thTh;
  break;
  case 97:
    return LanguageCode.tiEt;
  break;
  case 98:
    return LanguageCode.trTr;
  break;
  case 99:
    return LanguageCode.tkLatnTm;
  break;
  case 100:
    return LanguageCode.ukUa;
  break;
  case 101:
    return LanguageCode.ur;
  break;
  case 102:
    return LanguageCode.ugArab;
  break;
  case 103:
    return LanguageCode.uzCyrlUz;
  break;
  case 104:
    return LanguageCode.uzLatnUz;
  break;
  case 105:
    return LanguageCode.catEs;
  break;
  case 106:
    return LanguageCode.viVn;
  break;
  case 107:
    return LanguageCode.cyGb;
  break;
  case 108:
    return LanguageCode.woLatn;
  break;
  case 109:
    return LanguageCode.yoLatn;
  break;
  default:
    throw StateError("Invalid numeric value $handle for LanguageCode enum.");
  }
}

void sdk_core_LanguageCode_releaseFfiHandle(int handle) {}

final _sdk_core_LanguageCode_create_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Pointer<Void> Function(Uint32),
    Pointer<Void> Function(int)
  >('here_sdk_sdk_core_LanguageCode_create_handle_nullable'));
final _sdk_core_LanguageCode_release_handle_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Void Function(Pointer<Void>),
    void Function(Pointer<Void>)
  >('here_sdk_sdk_core_LanguageCode_release_handle_nullable'));
final _sdk_core_LanguageCode_get_value_nullable = __lib.catchArgumentError(() => __lib.nativeLibrary.lookupFunction<
    Uint32 Function(Pointer<Void>),
    int Function(Pointer<Void>)
  >('here_sdk_sdk_core_LanguageCode_get_value_nullable'));

Pointer<Void> sdk_core_LanguageCode_toFfi_nullable(LanguageCode value) {
  if (value == null) return Pointer<Void>.fromAddress(0);
  final _handle = sdk_core_LanguageCode_toFfi(value);
  final result = _sdk_core_LanguageCode_create_handle_nullable(_handle);
  sdk_core_LanguageCode_releaseFfiHandle(_handle);
  return result;
}

LanguageCode sdk_core_LanguageCode_fromFfi_nullable(Pointer<Void> handle) {
  if (handle.address == 0) return null;
  final _handle = _sdk_core_LanguageCode_get_value_nullable(handle);
  final result = sdk_core_LanguageCode_fromFfi(_handle);
  sdk_core_LanguageCode_releaseFfiHandle(_handle);
  return result;
}

void sdk_core_LanguageCode_releaseFfiHandle_nullable(Pointer<Void> handle) =>
  _sdk_core_LanguageCode_release_handle_nullable(handle);

// End of LanguageCode "private" section.

