import 'package:flutter/material.dart';
import 'package:projectmehema/chatbot/select_bot.dart';
import 'package:auto_size_text/auto_size_text.dart';

class ChatBot extends StatefulWidget {
  const ChatBot({super.key}); 
  @override
  State<ChatBot> createState() => _ChatBotState();
}

class _ChatBotState extends State<ChatBot> {
  int currentQuestion = 0;
  List<String> answers = List.filled(21, '');

  List<String> questions = [
    "1 Tn lK.dgqfjka miq jkafka o@", //Kanagatuwa
    "2 wkd.;h ms<sn|j Tnf.a n,dfmdfrd;a;=j flfiao@",//Anagathaya
    "3 Tn mrdcs;fhl= fia yef`.ao@", //Parajithaya
    "4 Tn lrk jev lghq;= .ek Tng oefkkafka flfiao@",//Wadakatayuthu
    "5 Tng jroldrS ye`.Sula oefka o@",//Waradakaraya
    "6 Tn o`vqjula úÈk njla yef`.a o@",//Dandanaya
    "7 Tng Tn .ek we;s u;h@",//Obe Mathaya
    "8 Tng cSj;a úu ms<sn`oj yef`.kafka flfiao@",//SiyaDivi_nasa_Ganeema
    "9 Tn y`vkjdo@",//Farcry_3
    "10 Tnf.a fmkqu flfia o@",//Kathai_Monster
    "11 Tfí kqreiaik iajNdjh jeäù we;a o@",//nurussana
    "12 Tnf.a wka wh .ek fidhdne,Su flfiao@",//An aya gana soya baleema
    "13 Tfí ;SrK .ekSfï yelshdj flfiao@",//Theerana
    "14 Tnf.a fmkqu flfiao@",//Penuma
    "15 Tn jev j, ksr;ùu flfiao@",//Wada kireema
    "16 Tfí kskao flfia o@",//Ninda
    "17 Tn fjfyig m;a fjkjd o@",//Wehesa
    "18 Tfí lEu ioyd reÑl;ajh flfia o@",//Kema Ruchikathwaya
    "19 Tfí nr wvq ù we;a o@",//Bara
    "20 Tfí fi!LH .ek ìfhka miqjkafka o@",//Health
    "21 Tfí ldufha fh§u ms<sno reÑl;ajh flfia o@",//Sex
  ];

  List<List<String>> options = [
    ["uu lK.dgqfjka miq fkdfjñ'", "uu lK.dgqfjka miq fjñ'", "uu .e,ùug fkdyels lK.gqjlska yeu úgu fmf<ñ'", "uu flfiaj;a bjiSug fkdkels lK.dgqj,ska yeu úgu fmf,ñ'"],//Kanagatuwa
    ["ud yg wkd.;h ms<sn|j jeä n,dfmdfrd;a;=lv jQ .;shla ke;'", "ud yg wkd.;h ms<sn|j jeä n,dfmdfrd;a;=lv jQ .;shla we;'", "ud yg wkd.;fha i;=gq ùug lsisjla ke;s nj yef.a'", "ud yg wkd.;h b;d wÿre nj;a th lsisfia;au fydo w;g yeßug fkdyels nj;a yef.a'"], //Anagathaya
    ["uu mrð;fhla hehs fkdyef.a'", "uu idudkah wfhl=g jv mrð;fhla hehs  yef.a'", "w;S;h foi yÍ n,k l, uq¿ ðú;h mqrdu mrdð;h biau;= ù we;'", "uu mQ¾K mrð;fhl= hhs yef.a'"],//Parajithaya
    ["uu lrk lghq;= j,sk ,nk i;=g fmr mßÈu fõ'", "uu lrk lghq;= j,ska ,nk i;=g fmr mßäu fkd,efí'", "uu lrk lsisu fohlska kshu i;=gla ;j ÿrg;a fkd,efí'", "ug iEu fohlau fkdi;=gg fyda tmdùu f.k foa'"],//Wadakatayuthu
    ["uu je/oaola l<d hehs ye.Sula ug we;s fkdfõ'", "uu je/oaola l<d hehs ye.Sula ug bo ysg w;s fõ'", "iEfykak jrola l<e hehs ye.Sula ug fndfyd fõ,djg we;s fõ'", "jrola  l<d hehs lshk ye.Su ug È.gu ;sfí'"],//Waradakaraya
    ["uu ovqjula úÈk nj fkdyef.hs'", "ug ovqjula úÈug fõoehs ye.Sula we;s fõ'", "ug ovqjula ,efí hhs isf;a'", "uu ovqjula úÈñka isák nj yef.hs'"],//Dandanaya
    ["ud yg ud .eku tmd jqk iajNdjhla ke;'", "ud yg ud .eku tmd jqk iajNdjhla we;'", "u yg ud .ek ;o n, tmd jQ iajNdjhla we;'", "uu ud yg ffjr lrñ'"],//Obe Mathaya
    ["ug ishÈú kid .ekSug woyila ke;'", "ug ishÈú kid .ekSug woyila m, jqjo uu tAj l%sh;aul fkdlrñ'", "ug ishÈú kid .ekSug leu;shs'", "wjia:djla ,o fyd;a uu ishÈú kid .ksñ'"],//SiyaDivi_nasa_Ganeema
    ["uu idudkafhka w`vk m%udkh jeä ù ke;'", "uu idudkafhka w`vk m%udkh jeä ù we;'", "uu ieu úgu wvñ'", "ug wvkakg lÿ¿ tka ke;'"],//FarCry_3
    ["uf.a fmkqu fmrg jvd krl hhs fkdis;ñ'", "uf.a fmkqu is;a weo fkd.kakd nj is;ñ'", "ug uf.a fmkqfï is;a weo .kakd iq¿nj ke;s lrk iaÓr fjkialï we;s jk nj yefÕhs'", "uf.a fmkqu le; hhs uu úYajdi lrñ'"],//Kathai_Monster
    ["uf.a kqreiaik iajNdjh jeäù ke;'","kqreiaik iq¿ nj fmrg jvd jeäù we;'","iEu úgu kqreiaik iq¿ núka miq fjñ'","fmr§ ug kqreiaiq lsisu fohlska ud oeka fkdßiaiqug m;a fkdfõ'"],//Nurussana
    ["uf.a wka wh .ek fidhd ne,Su k;r ù ke;'","uu fmr ;rï wka wh .ek fidhd n,kafka ke;'","udf.a wka wh .ek fidhd ne,Su fndfydÿrg wvq ù we;'","udf.a wka wh .ek fidhd ne,Su iïmQ¾kfhka wvq ù we;'"],//An ayagana Soyabaleema
    ["uf.a ;Srk .ekSfï yelshdj fmr mßÈuhs'","fmrg jvd uu ;SrK .ekSu l,aouhs'","ug ;SrK .ekSug fmrg jvd wmyiqhs'","ug lsisu ;SrKhla .ekSug fkdyelshs'"],//Theerana
    ["uf.a fmkqu fmrg jvd krl hhs fkdis;ñ'","uf.a fmkqu is;a weo fkd.kakd nj is;ñ'","ug uf.a fmkqfï is;a weo .kakd iq¿nj ke;s lrk iaÓr fjkialï we;s jk nj yefÕhs'","uf.a fmkqu le; hhs uu úYajdi lrñ'"],//Penuma
    ["ug fmr mßÈu jefvys fh§ug mq¿jk'a","jev mgka .ekSug fmr wu;r jEhula fh§ug wjYah fõ'","uu lrk iEu fohlgu úYd, mßY%uhla fh§ug wjYah fõ'","ug lsisjla lsÍug fkdyelsh'"],//Wada kireema
    ["ug fmr fuka fyd¢ka ksod .ekSug yelsh'","ug fmr fuka fyd¢ka ksod .ekSug fkdyelsh'","ug idudkH fõ,djg mehlg fyda meh follg l<ska msìfok w;r h<s;a kskaog jeàug fkdyelsh'","ug idudkH fõ,djg l<ska meh lsysmhlg l<ska msìfok w;r h<s;a kskaog jeàug fkdyelsh'"],//Ninda
    ["uu idudkH ;;ajhg jvd fjfyig m;a fkdfjñ'","uu fmrg jvd blaukska úvdjg m;afjñ'","uu lrk iEu fohlskau mdfya úvdjg m;a fjñ'","uu lsisu fohla lr .ekSug neß jk f,i fjfyig m;a ù isáñ'"],//Wehesa
    ["uf.a lEu reÑh fmr fuka we;'","uf.a lEu reÑh fmr ;rï fyd| ke;'","ud yg lEu wreÑhla we;'","ud yg lEu reÑhla we;af;au ke;'"],//Kema Ruchikathwaya
    ["uf.a nr miq.sh jljdkqfõ wvq ù ke;'","uf.a nr rd;a;,a lsf,da .%Eï myg jvd wvq ù we;'","uf.a nr rd;a;,a lsf,da .%Eï oyhg jvd wvq ù we;'","uf.a nr rd;a;,a lsf,da .%Eï myf,djg jvd wvq ù we;'","uf.a nr wvq lr .ekSu Wfoid wvqfjka wdydr .ksñ'"],//Bara
    ["uu fmrg jvd fi!LH .ek ìfhka miq fkdfjñ'","uu fõokd yd lelal=ï ms<sn|j fyda WordndO fyda u, noaOh jeks foa .ek ìfhka miq fjñ'","uu uf.a fi!LH ;;a;ajh .ek b;d ìfhka miq fjñ' ug tA yer fjk lsis fohla is;Sug wmyiqh'","uu uf.a fi!LH .ek fld;rï ìho h;fyd;a lsisjla is;Sug neßh'"],//Health
    ["fjkila uE;l§ isÿù ke;'","fmrg jvd leue;a; wvq ù we;'","fmrg jvd leue;a; fndfyda fia wvqù we;'","ug lsisÿ leue;a;la ke;'"],//Sex
  ];

  void nextQuestion() {
    if (currentQuestion < questions.length - 1) {
      setState(() {
        currentQuestion++;
      });
    } else {
      // Display result and end chat
      _showResultDialog();

    }
  }

  void _showResultDialog() {
    // Build and show the result dialog with user's answers
    // You can customize the dialog to display the answers as you like
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Result"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              for (var i = 0; i < questions.length; i++)
                Text("${questions[i]} ${answers[i]}",
                  style: const TextStyle(fontFamily: 'FM-Bindumathi',fontSize: 15)),

            ],
          ),
          actions: <Widget>[
            TextButton(
              child: const Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const SelectBot()));
              },
            ),
          ],
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Align(
          alignment: AlignmentDirectional(-1.00, -1.00),
          child: Text(
            'AI MeHeMa Chatbot',
            style: TextStyle(
                  fontFamily: 'Outfit',
                  color: Colors.white,
                  fontSize: 22,
            ),
          ),
        ),
      ),     
      body: SafeArea(
        child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              const SizedBox(height: 20),
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Align(
                        alignment: const AlignmentDirectional(-1.00, -1.00),
                        child: Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                          child: Column(
                            children: [
                              AutoSizeText(
                                questions[currentQuestion],
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontFamily: 'FM-Bindumathi',
                                  fontSize: 26,
                                  fontWeight: FontWeight.bold,
                                ),
                                minFontSize: 10,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],  
                  ),
                ],
              ),
              for (var option in options[currentQuestion])
                Padding(
                  padding:const EdgeInsetsDirectional.fromSTEB(0, 50, 0, 0),
                  child: Container(
                    width: 225,
                    height: 70,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 57, 145, 218), 
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: TextButton( 
                      onPressed: () {
                        setState(() {
                          answers[currentQuestion] = option;
                          nextQuestion();
                        });
                      },
                      child: Text(
                        option,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontFamily: 'FMDerana',
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),  
          ),
        );
      }
    }
