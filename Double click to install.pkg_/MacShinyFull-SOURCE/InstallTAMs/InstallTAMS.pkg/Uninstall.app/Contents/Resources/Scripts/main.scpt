FasdUAS 1.101.10   ��   ��    k             l     ����  n      	  I    �� 
���� 	0 logit   
  ��  m       �   ( U n i n s t a l l S c p t S t a r t e d��  ��   	  f     ��  ��        l    ����  n       I    �� ���� 0 	sendevent 	sendEvent   ��  m    	   �   ( U n i n s t a l l S c p t S t a r t e d��  ��     f    ��  ��        l    ����  n       I    �� ���� 	0 logit     ��  m       �    1 s t   e v e n t   s e n t��  ��     f    ��  ��       !   l     �� " #��   "  return    # � $ $  r e t u r n !  % & % l     �� ' (��   '  set m to me    ( � ) )  s e t   m   t o   m e &  * + * l     �� , -��   , " set a to current application    - � . . 8 s e t   a   t o   c u r r e n t   a p p l i c a t i o n +  / 0 / l     �� 1 2��   1 , &do shell script "ls >~/Desktop/ls.txt"    2 � 3 3 L d o   s h e l l   s c r i p t   " l s   > ~ / D e s k t o p / l s . t x t " 0  4 5 4 l     ��������  ��  ��   5  6 7 6 l   ] 8���� 8 Q    ] 9 : ; 9 k    5 < <  = > = r     ? @ ? I   �� A��
�� .sysorpthalis        TEXT A m     B B � C C $ U n i n s t a l l S c r i p t . s h��   @ o      ���� 0 
scriptpath 
scriptPath >  D E D r     % F G F n     # H I H 1   ! #��
�� 
psxp I o     !���� 0 
scriptpath 
scriptPath G o      ���� 0 scriptpathp scriptPathP E  J K J r   & - L M L I  & +�� N��
�� .sysorpthalis        TEXT N m   & ' O O � P P * U n i n s t a l l M a c S h i n y . p k g��   M o      ���� 0 pkgpath pkgPath K  Q R Q r   . 3 S T S n   . 1 U V U 1   / 1��
�� 
psxp V o   . /���� 0 pkgpath pkgPath T o      ���� 0 pkgpathp pkgPathP R  W X W l  4 4�� Y Z��   Y : 4set sendEventPath to path to resource "SendEvent.sh"    Z � [ [ h s e t   s e n d E v e n t P a t h   t o   p a t h   t o   r e s o u r c e   " S e n d E v e n t . s h " X  \�� \ l  4 4�� ] ^��   ] 7 1set sendEventPathP to POSIX path of sendEventPath    ^ � _ _ b s e t   s e n d E v e n t P a t h P   t o   P O S I X   p a t h   o f   s e n d E v e n t P a t h��   : R      �� ` a
�� .ascrerr ****      � **** ` o      ���� 0 errormsg errorMsg a �� b��
�� 
errn b o      ���� 0 errornum errorNum��   ; k   = ] c c  d e d n  = O f g f I   > O�� h���� 	0 logit   h  i�� i b   > K j k j b   > I l m l b   > E n o n m   > ? p p � q q , e r r   p a t h   t o   r e s o u r c e :   o l  ? D r���� r c   ? D s t s o   ? @���� 0 errornum errorNum t m   @ C��
�� 
TEXT��  ��   m m   E H u u � v v    k o   I J���� 0 errormsg errorMsg��  ��   g  f   = > e  w x w r   P U y z y m   P S { { � | | � / L i b r a r y / A p p l i c a t i o n   S u p p o r t / C y a n S o f t / M a c S h i n y / U n i n s t a l l . a p p / C o n t e n t s / R e s o u r c e s / U n i n s t a l l S c r i p t . s h z o      ���� 0 scriptpathp scriptPathP x  } ~ } r   V [  �  m   V Y � � � � � � / L i b r a r y / A p p l i c a t i o n   S u p p o r t / C y a n S o f t / M a c S h i n y / U n i n s t a l l . a p p / C o n t e n t s / R e s o u r c e s / U n i n s t a l l M a c S h i n y . p k g � o      ���� 0 pkgpathp pkgPathP ~  ��� � l  \ \�� � ���   � z tset sendEventPathP to "/Library/Application Support/CyanSoft/MacShiny/Uninstall.app/Contents/Resources/SendEvent.sh"    � � � � � s e t   s e n d E v e n t P a t h P   t o   " / L i b r a r y / A p p l i c a t i o n   S u p p o r t / C y a n S o f t / M a c S h i n y / U n i n s t a l l . a p p / C o n t e n t s / R e s o u r c e s / S e n d E v e n t . s h "��  ��  ��   7  � � � l     ��������  ��  ��   �  � � � l  ^ h ����� � n  ^ h � � � I   _ h�� ����� 	0 logit   �  ��� � b   _ d � � � m   _ b � � � � �   s c r i p t   l o c a t i o n : � o   b c���� 0 scriptpathp scriptPathP��  ��   �  f   ^ _��  ��   �  � � � l  i n ����� � r   i n � � � m   i j����   � o      ���� 0 	usefinder 	useFinder��  ��   �  � � � l     ��������  ��  ��   �  � � � l  o" ����� � Q   o" � � � � r   r � � � � I  r ��� � �
�� .sysodlogaskr        TEXT � m   r u � � � � � X A r e   y o u   s u r e   y o u   w a n t   t o   u n i n s t a l l   M a c S h i n y ? � �� � �
�� 
btns � J   x � � �  � � � m   x { � � � � �  N o �  ��� � m   { ~ � � � � �  Y e s��   � �� � �
�� 
dflt � m   � � � � � � �  Y e s � �� � �
�� 
appr � m   � � � � � � � ( M a c S h i n y   U n i n s t a l l e r � �� ���
�� 
disp � m   � ���
�� stic   ��   � o      ���� 0 dialogresult dialogResult � R      �� � �
�� .ascrerr ****      � **** � o      ���� 0 errormsg errorMsg � �� ���
�� 
errn � o      ���� 0 errornum errorNum��   � Q   �" � � � � k   � � �  � � � n  � � � � � I   � ��� ����� 	0 logit   �  ��� � b   � � � � � b   � � � � � b   � � � � � m   � � � � � � � 4 f a i l e d   t o   d i s p l a y   d i a l o g :   � l  � � ����� � c   � � � � � o   � ����� 0 errornum errorNum � m   � ���
�� 
TEXT��  ��   � m   � � � � � � �    � o   � ����� 0 errormsg errorMsg��  ��   �  f   � � �  � � � n  � � � � � I   � ��� ����� 0 
sendevente 
sendEventE �  � � � m   � � � � � � � $ E r r o r D i s p l a y D i a l o g �  ��� � o   � ����� 0 errornum errorNum��  ��   �  f   � � �  � � � r   � � � � � m   � �����  � o      ���� 0 	usefinder 	useFinder �  ��� � O   � � � � k   � � �  � � � n  � � � � � I   � ��� ����� 	0 logit   �  ��� � m   � � � � � � �  U s e F i n d e r D l g��  ��   �  f   � � �  � � � n  � � � � � I   � ��� ����� 0 	sendevent 	sendEvent �  ��� � m   � � � � � � �  U s e F i n d e r D l g��  ��   �  f   � � �  ��� � r   � � � � I  �
�� � �
�� .sysodlogaskr        TEXT � m   � � � � � � � X A r e   y o u   s u r e   y o u   w a n t   t o   u n i n s t a l l   M a c S h i n y ? � �� � �
�� 
btns � J   � � � �    m   � � �  N o �� m   � � �  Y e s��   � ��
�� 
dflt m   � �		 �

  Y e s ��
�� 
appr m   � � � ( M a c S h i n y   U n i n s t a l l e r ����
�� 
disp m  ��
�� stic   ��   � o      ���� 0 dialogresult dialogResult��   � m   � ��                                                                                  MACS  alis    t  Macintosh HD               ���H+   ��
Finder.app                                                      L\�C�        ����  	                CoreServices    ���      �B�     �� �� ��  6Macintosh HD:System: Library: CoreServices: Finder.app   
 F i n d e r . a p p    M a c i n t o s h   H D  &System/Library/CoreServices/Finder.app  / ��  ��   � R      ��
�� .ascrerr ****      � **** o      ���� 0 errormsg errorMsg ����
�� 
errn o      ���� 0 errornum errorNum��   � k  "  l ����   T Nmy logit("failed to display dialog: " & (errorNum as string) & " " & errorMsg)    � � m y   l o g i t ( " f a i l e d   t o   d i s p l a y   d i a l o g :   "   &   ( e r r o r N u m   a s   s t r i n g )   &   "   "   &   e r r o r M s g )  l ����   3 -my sendEventE("ErrorDisplayDialog", errorNum)    � Z m y   s e n d E v e n t E ( " E r r o r D i s p l a y D i a l o g " ,   e r r o r N u m )   l ����~��  �  �~    !"! n #$# I  �}�|�{�} "0 useswuininstall UseSWUininstall�|  �{  $  f  " %�z% I "�y�x�w
�y .aevtquitnull��� ��� null�x  �w  �z  ��  ��   � &'& l     �v�u�t�v  �u  �t  ' ()( l #�*�s�r* Z  #�+,-�q+ = #../. n  #*010 1  &*�p
�p 
bhit1 o  #&�o�o 0 dialogresult dialogResult/ m  *-22 �33  Y e s, Z  1�45�n64 = 16787 l 149�m�l9 o  14�k�k 0 	usefinder 	useFinder�m  �l  8 m  45�j�j 5 k  9F:: ;<; l 99�i=>�i  = 	 try   > �??  t r y< @A@ l 99�hBC�h  B  tell application "Finder"   C �DD 2 t e l l   a p p l i c a t i o n   " F i n d e r "A EFE l 99�gGH�g  G 0 *	my logit("UseFinderOpenPkg: " & pkgPathP)   H �II T 	 m y   l o g i t ( " U s e F i n d e r O p e n P k g :   "   &   p k g P a t h P )F JKJ l 99�fLM�f  L ' !	my sendEvent("UseFinderOpenPkg")   M �NN B 	 m y   s e n d E v e n t ( " U s e F i n d e r O p e n P k g " )K OPO l 99�eQR�e  Q @ :do shell script "open \"" & quoted form of pkgPathP & "\""   R �SS t d o   s h e l l   s c r i p t   " o p e n   \ " "   &   q u o t e d   f o r m   o f   p k g P a t h P   &   " \ " "P TUT l 99�d�c�b�d  �c  �b  U VWV l 99�aXY�a  X 2 ,	do shell script "open \"" & pkgPathP & "\""   Y �ZZ X 	 d o   s h e l l   s c r i p t   " o p e n   \ " "   &   p k g P a t h P   &   " \ " "W [\[ l 99�`]^�`  ]  open pkgPathP   ^ �__  o p e n   p k g P a t h P\ `a` l 99�_bc�_  b  end tell   c �dd  e n d   t e l la efe l 99�^gh�^  g ' !on error errorMsg number errorNum   h �ii B o n   e r r o r   e r r o r M s g   n u m b e r   e r r o r N u mf jkj l 99�]lm�]  l c ]	my logit("failed to open uninstall pkg in finder: " & (errorNum as string) & " " & errorMsg)   m �nn � 	 m y   l o g i t ( " f a i l e d   t o   o p e n   u n i n s t a l l   p k g   i n   f i n d e r :   "   &   ( e r r o r N u m   a s   s t r i n g )   &   "   "   &   e r r o r M s g )k opo l 99�\qr�\  q 6 0		my sendEventE("UseFinderOpenPkgErr", errorNum)   r �ss ` 	 	 m y   s e n d E v e n t E ( " U s e F i n d e r O p e n P k g E r r " ,   e r r o r N u m )p tut n 9>vwv I  :>�[�Z�Y�[  0 useswuninstall UseSWUninstall�Z  �Y  w  f  9:u xyx I ?D�X�W�V
�X .aevtquitnull��� ��� null�W  �V  y z{z l EE�U|}�U  |  	end try   } �~~  	 e n d   t r y{ � l EE�T���T  � 5 /	my logit("Done UseFinderOpenPkg: " & pkgPathP)   � ��� ^ 	 m y   l o g i t ( " D o n e   U s e F i n d e r O p e n P k g :   "   &   p k g P a t h P )� ��� l EE�S���S  � + %	my sendEvent("UseFinderOpenPkgDone")   � ��� J 	 m y   s e n d E v e n t ( " U s e F i n d e r O p e n P k g D o n e " )� ��� l EE�R���R  �  	quit   � ��� 
 	 q u i t� ��Q� l EE�P�O�N�P  �O  �N  �Q  �n  6 k  I��� ��� Q  IH���� k  L��� ��� l LL�M���M  � [ Udo shell script quoted form of POSIX path of scriptPath with administrator privileges   � ��� � d o   s h e l l   s c r i p t   q u o t e d   f o r m   o f   P O S I X   p a t h   o f   s c r i p t P a t h   w i t h   a d m i n i s t r a t o r   p r i v i l e g e s� ��� l LL�L�K�J�L  �K  �J  � ��� n LT��� I  MT�I��H�I 	0 logit  � ��G� m  MP�� ��� j s t a r t   s h e l l   s c r i p t   w i t h   a d m i n   r i g h t   ( p a s s w o r d   p r o m p t )�G  �H  �  f  LM� ��� n U]��� I  V]�F��E�F 0 	sendevent 	sendEvent� ��D� m  VY�� ���   S t a r t S h e l l S c r i p t�D  �E  �  f  UV� ��� l ^^�C�B�A�C  �B  �A  � ��� r  ^k��� b  ^g��� b  ^c��� m  ^a�� ���  / b i n / s h     '� o  ab�@�@ 0 scriptpathp scriptPathP� m  cf�� ���  '� o      �?�? 0 scriptpathp2 scriptPathP2� ��� n lt��� I  mt�>��=�> 	0 logit  � ��<� o  mp�;�; 0 scriptpathp2 scriptPathP2�<  �=  �  f  lm� ��� l uu�:�9�8�:  �9  �8  � ��� I u��7��
�7 .sysoexecTEXT���     TEXT� o  ux�6�6 0 scriptpathp2 scriptPathP2� �5��4
�5 
badm� m  {|�3
�3 boovtrue�4  � ��2� l ���1���1  � O Ido shell script quoted form of scriptPathP2 with administrator privileges   � ��� � d o   s h e l l   s c r i p t   q u o t e d   f o r m   o f   s c r i p t P a t h P 2   w i t h   a d m i n i s t r a t o r   p r i v i l e g e s�2  � R      �0��
�0 .ascrerr ****      � ****� o      �/�/ 0 errormsg errorMsg� �.��-
�. 
errn� o      �,�, 0 errornum errorNum�-  � k  �H�� ��� Z  �B����� = ����� l ����+�*� o  ���)�) 0 errornum errorNum�+  �*  � m  ���(�(��� k  ���� ��� n ����� I  ���'��&�' 	0 logit  � ��%� m  ���� ��� 4 U s e r   c a n c e l   p a s s w o r d   e n t r y�%  �&  �  f  ��� ��� n ����� I  ���$��#�$ 0 	sendevent 	sendEvent� ��"� m  ���� ��� . U s e r C a n c e l P a s s w o r d E n t r y�"  �#  �  f  ��� ��� l ���!� ��!  �   �  � ��� n ����� I  ������ 0 moveback MoveBack�  �  �  f  ��� ��� I �����
� .sysodlogaskr        TEXT� m  ���� ��� 2 M a c S h i n y   w a s   n o t   r e m o v e d .� ���
� 
btns� J  ���� ��� m  ���� ���  O k�  � ���
� 
dflt� m  ���� ���  O k� �� 
� 
appr� m  �� � ( M a c S h i n y   U n i n s t a l l e r  ��
� 
disp m  ���
� stic   �  �  �  = �� l ���� o  ���� 0 errornum errorNum�  �   m  ���� � 	�	 k  ��

  n �� I  ����� 	0 logit   � m  �� � " U s e r   c a n c e l   i n   S W�  �    f  ��  n �� I  ���
�	�
 0 	sendevent 	sendEvent � m  �� �  U s e r C a n c e l S W�  �	    f  ��  l ������  �  �    n ��  I  ������ 0 moveback MoveBack�  �     f  �� !�! l ��� "#�   " � �display dialog "MacShiny was not removed. SW Cancel" buttons {"Ok"} default button "Ok" with title "MacShiny Uninstaller" with icon note   # �$$ d i s p l a y   d i a l o g   " M a c S h i n y   w a s   n o t   r e m o v e d .   S W   C a n c e l "   b u t t o n s   { " O k " }   d e f a u l t   b u t t o n   " O k "   w i t h   t i t l e   " M a c S h i n y   U n i n s t a l l e r "   w i t h   i c o n   n o t e�  �  � k  �B%% &'& n �()( I  ���*���� 	0 logit  * +��+ b  �,-, b  �./. b  ��010 m  ��22 �33 0 U n i n s t a l l S c r i p t   f a i l e d :  1 l ��4����4 c  ��565 o  ������ 0 errornum errorNum6 m  ����
�� 
TEXT��  ��  / m  �77 �88   - o  ���� 0 errormsg errorMsg��  ��  )  f  ��' 9:9 n 	;<; I  
��=���� 0 
sendevente 
sendEventE= >?> m  
@@ �AA * U n i n s t a l l S c r i p t F a i l e d? B��B o  ���� 0 errornum errorNum��  ��  <  f  	
: C��C I B��DE
�� .sysodlogaskr        TEXTD b  "FGF b   HIH b  JKJ m  LL �MM 6 M a c S h i n y   u n i n s t a l l   f a i l e d :  K l N����N c  OPO o  ���� 0 errornum errorNumP m  ��
�� 
TEXT��  ��  I m  QQ �RR   G o   !���� 0 errormsg errorMsgE ��ST
�� 
btnsS J  %*UU V��V m  %(WW �XX  O k��  T ��YZ
�� 
dfltY m  -0[[ �\\  O kZ ��]^
�� 
appr] m  36__ �`` ( M a c S h i n y   U n i n s t a l l e r^ ��a��
�� 
dispa m  9<��
�� stic   ��  ��  � bcb l CC��de��  d  return   e �ff  r e t u r nc g��g I CH������
�� .aevtquitnull��� ��� null��  ��  ��  � hih l II��������  ��  ��  i jkj n IQlml I  JQ��n���� 	0 logit  n o��o m  JMpp �qq * U n i n s t a l l S c p t F i n i s h e d��  ��  m  f  IJk rsr n RZtut I  SZ��v���� 0 	sendevent 	sendEventv w��w m  SVxx �yy * U n i n s t a l l S c p t F i n i s h e d��  ��  u  f  RSs z{z l [[��������  ��  ��  { |}| I [~��~
�� .sysodlogaskr        TEXT~ m  [^�� ��� D M a c S h i n y   s u c c e s s f u l l y   u n i n s t a l l e d . ����
�� 
btns� J  af�� ���� m  ad�� ���  O k��  � ����
�� 
dflt� m  il�� ���  O k� ����
�� 
appr� m  or�� ��� ( M a c S h i n y   U n i n s t a l l e r� �����
�� 
disp� m  ux��
�� stic   ��  } ���� I �������
�� .aevtquitnull��� ��� null��  ��  ��  - ��� = ����� n  ����� 1  ����
�� 
bhit� o  ������ 0 dialogresult dialogResult� m  ���� ���  N o� ���� k  ���� ��� n ����� I  ��������� 	0 logit  � ���� m  ���� ��� $ U s e r   c a n c e l   i n   d l g��  ��  �  f  ��� ��� n ����� I  ��������� 0 	sendevent 	sendEvent� ���� m  ���� ���  U s e r C a n c e l D l g��  ��  �  f  ��� ��� l ����������  ��  ��  � ���� n ����� I  ���������� 0 moveback MoveBack��  ��  �  f  ����  ��  �q  �s  �r  ) ��� l     ������  �  return   � ���  r e t u r n� ��� l �������� I ��������
�� .aevtquitnull��� ��� null��  ��  ��  ��  � ��� l     ��������  ��  ��  � ��� i    ��� I      ��������  0 useswuninstall UseSWUninstall��  ��  � Q     4���� k    �� ��� I   �����
�� .sysoexecTEXT���     TEXT� m    �� ��� � o p e n   - a   ' / L i b r a r y / A p p l i c a t i o n   S u p p o r t / C y a n S o f t / S u p p o r t W i z a r d . a p p '   - - a r g s   ~ / . T r a s h / M a c S h i n y . a p p   - U n i n s t a l l S c r i p t��  � ��� n  	 ��� I   
 ������� 	0 logit  � ���� m   
 �� ��� : S W   - U n i n s t a l l S c r i p t   l a u n c h e d  ��  ��  �  f   	 
� ���� n   ��� I    ������� 0 	sendevent 	sendEvent� ���� m    �� ��� , S t a r t S W U n i n s t a l l S c r i p t��  ��  �  f    ��  � R      ����
�� .ascrerr ****      � ****� o      ���� 0 errormsg errorMsg� �����
�� 
errn� o      ���� 0 errornum errorNum��  � k    4�� ��� n   ,��� I    ,������� 	0 logit  � ���� b    (��� b    &��� b    $��� m     �� ��� ( f a i l e d   t o   s t a r t   S W :  � l    #������ c     #��� o     !���� 0 errornum errorNum� m   ! "��
�� 
TEXT��  ��  � m   $ %�� ���   � o   & '���� 0 errormsg errorMsg��  ��  �  f    � ���� n  - 4��� I   . 4������� 0 
sendevente 
sendEventE� ��� m   . /�� ��� 8 S t a r t S W U n i n s t a l l S c r i p t F a i l e d� ���� o   / 0���� 0 errornum errorNum��  ��  �  f   - .��  � ��� l     ��������  ��  ��  � ��� i   ��� I      �������� 0 moveback MoveBack��  ��  � Q     4���� k        I   ����
�� .sysoexecTEXT���     TEXT m     � � i f   [   - d   ~ / . T r a s h / M a c S h i n y . a p p   ]   ;   t h e n   m v   ~ / . T r a s h / M a c S h i n y . a p p   / A p p l i c a t i o n s / M a c S h i n y . a p p   ;   f i��    n  	 	 I   
 ��
���� 	0 logit  
 �� m   
  � $ M o v e   B a c k   F i n i s h e d��  ��  	  f   	 
 �� n    I    ������ 0 	sendevent 	sendEvent �� m     �   M o v e B a c k F i n i s h e d��  ��    f    ��  � R      ��
�� .ascrerr ****      � **** o      ���� 0 errormsg errorMsg ���
�� 
errn o      �~�~ 0 errornum errorNum�  � k    4  n   , I    ,�}�|�} 	0 logit   �{ b    (  b    &!"! b    $#$# m     %% �&& $ m o v e   b a c k   f a i l e d :  $ l    #'�z�y' c     #()( o     !�x�x 0 errornum errorNum) m   ! "�w
�w 
TEXT�z  �y  " m   $ %** �++     o   & '�v�v 0 errormsg errorMsg�{  �|    f     ,�u, n  - 4-.- I   . 4�t/�s�t 0 
sendevente 
sendEventE/ 010 m   . /22 �33  M o v e B a c k F a i l e d1 4�r4 o   / 0�q�q 0 errornum errorNum�r  �s  .  f   - .�u  � 565 l     �p�o�n�p  �o  �n  6 787 i   9:9 I      �m;�l�m 	0 logit  ; <�k< o      �j�j 0 
log_string  �k  �l  : Q     =>?= k    @@ ABA l   �iCD�i  C X Rdo shell script "mkdir $HOME/Library/Logs/CyanSoft" -- just in case it was deleted   D �EE � d o   s h e l l   s c r i p t   " m k d i r   $ H O M E / L i b r a r y / L o g s / C y a n S o f t "   - -   j u s t   i n   c a s e   i t   w a s   d e l e t e dB F�hF I   �gG�f
�g .sysoexecTEXT���     TEXTG b    HIH b    JKJ l 	  L�e�dL m    MM �NN : e c h o   ` d a t e   ' + % Y - % m - % d   % T :   ' ` "�e  �d  K o    �c�c 0 
log_string  I l 	  O�b�aO m    PP �QQ p "   > >   $ H O M E / L i b r a r y / L o g s / C y a n S o f t / M a c S h i n y U n i n s t a l l e r . l o g�b  �a  �f  �h  > R      �`RS
�` .ascrerr ****      � ****R o      �_�_ 0 errormsg errorMsgS �^T�]
�^ 
errnT o      �\�\ 0 errornum errorNum�]  ? l   �[�Z�Y�[  �Z  �Y  8 UVU l     �X�W�V�X  �W  �V  V WXW i   YZY I      �U[�T�U 0 	sendevent 	sendEvent[ \�S\ o      �R�R 0 
event_name  �S  �T  Z n    ]^] I    �Q_�P�Q 0 
sendevente 
sendEventE_ `a` o    �O�O 0 
event_name  a b�Nb m    �M�M  �N  �P  ^  f     X cdc l     �L�K�J�L  �K  �J  d efe i   ghg I      �Ii�H�I 0 
sendevente 
sendEventEi jkj o      �G�G 0 
event_name  k l�Fl o      �E�E 0 	error_num  �F  �H  h k     8mm non Z     pq�D�Cp >    rsr o     �B�B 0 	error_num  s m    �A�A  q r    tut b    vwv b    	xyx o    �@�@ 0 
event_name  y m    zz �{{ 
 & e r r =w l  	 |�?�>| c   	 }~} o   	 
�=�= 0 	error_num  ~ m   
 �<
�< 
TEXT�?  �>  u o      �;�; 0 
event_name  �D  �C  o � l   �:�9�8�:  �9  �8  � ��7� Q    8���� k    "�� ��� I    �6��5
�6 .sysoexecTEXT���     TEXT� b    ��� b    ��� m    �� ���� o s _ v e r = $ ( s w _ v e r s   - p r o d u c t V e r s i o n ) 
 s e r i a l = " $ ( i o r e g   - l   |   g r e p   I O P l a t f o r m S e r i a l N u m b e r   |   s e d   - e   ' s / . * \ " \ ( . * \ ) \ " / \ 1 / ' ) " 
 u r l = " h t t p : / / e v . m a c s h i n y . c o m / v e r s i o n . a s p x ? s t a t s T y p e = I n s t a l l E v e n t & p r o d u c t = M a c S h i n y & e v e n t =� o    �4�4 0 
event_name  � m    �� ���p & c i d = $ s e r i a l & O S V e r s i o n = $ o s _ v e r & c a l l e r = U n i n s t a l l S c r i p t " 
 e c h o   ` d a t e   ' + % Y - % m - % d   % T :   ' ` " $ u r l "   > >   $ H O M E / L i b r a r y / L o g s / C y a n S o f t / M a c S h i n y U n i n s t a l l e r . l o g 
 e c h o   $ u r l   > ~ / D e s k t o p / c u r l . t x t 
 c u r l   $ u r l�5  � ��� l  ! !�3���3  � d ^do shell script "sh '/Library/Application Support/CyanSoft/SendEvent.sh' '" & event_name & "'"   � ��� � d o   s h e l l   s c r i p t   " s h   ' / L i b r a r y / A p p l i c a t i o n   S u p p o r t / C y a n S o f t / S e n d E v e n t . s h '   ' "   &   e v e n t _ n a m e   &   " ' "� ��� l  ! !�2���2  � H Bdo shell script "sh '" & sendEventPathP & "' '" & event_name & "'"   � ��� � d o   s h e l l   s c r i p t   " s h   ' "   &   s e n d E v e n t P a t h P   &   " '   ' "   &   e v e n t _ n a m e   &   " ' "� ��� l  ! !�1�0�/�1  �0  �/  � ��.� l  ! !�-���-  � > 8do shell script "sh ./sendevent.sh '" & event_name & "'"   � ��� p d o   s h e l l   s c r i p t   " s h   . / s e n d e v e n t . s h   ' "   &   e v e n t _ n a m e   &   " ' "�.  � R      �,��
�, .ascrerr ****      � ****� o      �+�+ 0 errormsg errorMsg� �*��)
�* 
errn� o      �(�( 0 errornum errorNum�)  � n  * 8��� I   + 8�'��&�' 	0 logit  � ��%� b   + 4��� b   + 2��� b   + 0��� m   + ,�� ���  e r r   s e n d E v e n t :  � l  , /��$�#� c   , /��� o   , -�"�" 0 errornum errorNum� m   - .�!
�! 
TEXT�$  �#  � m   0 1�� ���   � o   2 3� �  0 errormsg errorMsg�%  �&  �  f   * +�7  f ��� l     ����  �  �  �       ���������  � �������  0 useswuninstall UseSWUninstall� 0 moveback MoveBack� 	0 logit  � 0 	sendevent 	sendEvent� 0 
sendevente 
sendEventE
� .aevtoappnull  �   � ****� ��������  0 useswuninstall UseSWUninstall�  �  � ��� 0 errormsg errorMsg� 0 errornum errorNum� ����������
���	
� .sysoexecTEXT���     TEXT� 	0 logit  � 0 	sendevent 	sendEvent� 0 errormsg errorMsg� ���
� 
errn� 0 errornum errorNum�  
�
 
TEXT�	 0 
sendevente 
sendEventE� 5 �j O)�k+ O)�k+ W X  )��&%�%�%k+ O)�l+ � �������� 0 moveback MoveBack�  �  � �� � 0 errormsg errorMsg�  0 errornum errorNum� ���������%��*2��
�� .sysoexecTEXT���     TEXT�� 	0 logit  �� 0 	sendevent 	sendEvent�� 0 errormsg errorMsg� ������
�� 
errn�� 0 errornum errorNum��  
�� 
TEXT�� 0 
sendevente 
sendEventE� 5 �j O)�k+ O)�k+ W X  )��&%�%�%k+ O)�l+ � ��:���������� 	0 logit  �� ����� �  ���� 0 
log_string  ��  � �������� 0 
log_string  �� 0 errormsg errorMsg�� 0 errornum errorNum� MP�����
�� .sysoexecTEXT���     TEXT�� 0 errormsg errorMsg� ������
�� 
errn�� 0 errornum errorNum��  ��  �%�%j W X  h� ��Z���������� 0 	sendevent 	sendEvent�� ����� �  ���� 0 
event_name  ��  � ���� 0 
event_name  � ���� 0 
sendevente 
sendEventE�� )�jl+  � ��h���������� 0 
sendevente 
sendEventE�� ����� �  ������ 0 
event_name  �� 0 	error_num  ��  � ���������� 0 
event_name  �� 0 	error_num  �� 0 errormsg errorMsg�� 0 errornum errorNum� 
z�������������
�� 
TEXT
�� .sysoexecTEXT���     TEXT�� 0 errormsg errorMsg� ������
�� 
errn�� 0 errornum errorNum��  �� 	0 logit  �� 9�j ��%��&%E�Y hO �%�%j OPW X  )��&%�%�%k+ 	� �����������
�� .aevtoappnull  �   � ****� k    ���  ��  ��  ��  6��  ���  ���  ��� (�� �����  ��  ��  � ������ 0 errormsg errorMsg�� 0 errornum errorNum� X �� ��  B�������� O������� p�� u { � ��� ��� � ��� ��� ����������� � � ��� � � �	������2�������������������������27@LQW[_px��������� 	0 logit  �� 0 	sendevent 	sendEvent
�� .sysorpthalis        TEXT�� 0 
scriptpath 
scriptPath
�� 
psxp�� 0 scriptpathp scriptPathP�� 0 pkgpath pkgPath�� 0 pkgpathp pkgPathP�� 0 errormsg errorMsg� ������
�� 
errn�� 0 errornum errorNum��  
�� 
TEXT�� 0 	usefinder 	useFinder
�� 
btns
�� 
dflt
�� 
appr
�� 
disp
�� stic   �� 
�� .sysodlogaskr        TEXT�� 0 dialogresult dialogResult�� 0 
sendevente 
sendEventE�� "0 useswuininstall UseSWUininstall
�� .aevtquitnull��� ��� null
�� 
bhit��  0 useswuninstall UseSWUninstall�� 0 scriptpathp2 scriptPathP2
�� 
badm
�� .sysoexecTEXT���     TEXT������ 0 moveback MoveBack
�� stic   �� ����)�k+ O)�k+ O)�k+ O "�j E�O��,E�O�j E�O��,E�OPW 'X  )�a &%a %�%k+ Oa E�Oa E�OPO)a �%k+ OjE` O /a a a a lva a a a a a a   !E` "W �X   m)a #�a &%a $%�%k+ O)a %�l+ &OkE` Oa ' >)a (k+ O)a )k+ Oa *a a +a ,lva a -a a .a a a   !E` "UW X  )j+ /O*j 0O_ "a 1,a 2 X_ k  )j+ 3O*j 0OPY= ;)a 4k+ O)a 5k+ Oa 6�%a 7%E` 8O)_ 8k+ O_ 8a 9el :OPW �X  �a ;  @)a <k+ O)a =k+ O)j+ >Oa ?a a @kva a Aa a Ba a Ca   !Y t�a D  )a Ek+ O)a Fk+ O)j+ >OPY P)a G�a &%a H%�%k+ O)a I�l+ &Oa J�a &%a K%�%a a Lkva a Ma a Na a Ca   !O*j 0O)a Ok+ O)a Pk+ Oa Qa a Rkva a Sa a Ta a Ca   !O*j 0Y +_ "a 1,a U  )a Vk+ O)a Wk+ O)j+ >Y hO*j 0 ascr  ��ޭ