// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'l10n.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class L10nAr extends L10n {
  L10nAr([String locale = 'ar']) : super(locale);

  @override
  String get alwaysUse24HourFormat => 'خاطئ';

  @override
  String get repeatPassword => 'أعد إدخال كلمة المرور';

  @override
  String get notAnImage => 'ليس ملف صورة.';

  @override
  String get remove => 'إزالة';

  @override
  String get importNow => 'استيراد الآن';

  @override
  String get importEmojis => 'استيراد الرموز التعبيرية';

  @override
  String get importFromZipFile => 'استيراد من ملف .zip';

  @override
  String get exportEmotePack => 'تصدير حزمة الرموز التعبيرية كـ .zip';

  @override
  String get replace => 'استبدال';

  @override
  String get about => 'حول';

  @override
  String aboutHomeserver(String homeserver) {
    return 'حول $homeserver';
  }

  @override
  String get accept => 'قبول';

  @override
  String acceptedTheInvitation(String username) {
    return '👍 $username قبل الدعوة';
  }

  @override
  String get account => 'الحساب';

  @override
  String activatedEndToEndEncryption(String username) {
    return '🔐 $username فعّل التشفير من الطرف إلى الطرف';
  }

  @override
  String get addEmail => 'إضافة بريد إلكتروني';

  @override
  String get confirmMatrixId => 'يرجى تأكيد معرف Matrix الخاص بك لحذف حسابك.';

  @override
  String supposedMxid(String mxid) {
    return 'يجب أن يكون هذا $mxid';
  }

  @override
  String get addChatDescription => 'أضف وصفًا للدردشة...';

  @override
  String get addToSpace => 'أضف إلى المساحة';

  @override
  String get admin => 'مشرف';

  @override
  String get alias => 'اسم مستعار';

  @override
  String get all => 'الكل';

  @override
  String get allChats => 'جميع الدردشات';

  @override
  String get commandHint_googly => 'أرسل عيون جاحظة';

  @override
  String get commandHint_cuddle => 'أرسل عناقًا';

  @override
  String get commandHint_hug => 'أرسل حضنًا';

  @override
  String googlyEyesContent(String senderName) {
    return '$senderName يرسل لك عيون جاحظة';
  }

  @override
  String cuddleContent(String senderName) {
    return '$senderName يعانقك';
  }

  @override
  String hugContent(String senderName) {
    return '$senderName يحتضنك';
  }

  @override
  String answeredTheCall(String senderName) {
    return '$senderName أجاب على المكالمة';
  }

  @override
  String get anyoneCanJoin => 'يمكن لأي شخص الانضمام';

  @override
  String get appLock => 'قفل التطبيق';

  @override
  String get appLockDescription => 'اقفل التطبيق عند عدم الاستخدام باستخدام رمز PIN';

  @override
  String get archive => 'أرشيف';

  @override
  String get areGuestsAllowedToJoin => 'هل يُسمح للضيوف بالانضمام';

  @override
  String get areYouSure => 'هل أنت متأكد؟';

  @override
  String get areYouSureYouWantToLogout => 'هل أنت متأكد أنك تريد تسجيل الخروج؟';

  @override
  String get askSSSSSign => 'لكي تتمكن من توقيع الشخص الآخر، يرجى إدخال عبارة المرور أو مفتاح الاسترداد لمخزن الأمان الخاص بك.';

  @override
  String askVerificationRequest(String username) {
    return 'قبول طلب التحقق هذا من $username؟';
  }

  @override
  String get autoplayImages => 'تشغيل الملصقات والرموز التعبيرية المتحركة تلقائيًا';

  @override
  String badServerLoginTypesException(String serverVersions, String supportedVersions, Object suportedVersions) {
    return 'يدعم الخادم أنواع تسجيل الدخول:\n$serverVersions\nلكن هذا التطبيق يدعم فقط:\n$supportedVersions';
  }

  @override
  String get sendTypingNotifications => 'إرسال إشعارات الكتابة';

  @override
  String get swipeRightToLeftToReply => 'اسحب من اليمين إلى اليسار للرد';

  @override
  String get sendOnEnter => 'إرسال عند الضغط على Enter';

  @override
  String badServerVersionsException(String serverVersions, String supportedVersions, Object suportedVersions) {
    return 'يدعم الخادم إصدارات Spec:\n$serverVersions\nلكن هذا التطبيق يدعم فقط $supportedVersions';
  }

  @override
  String countChatsAndCountParticipants(int chats, int participants) {
    return '$chats دردشات و $participants مشاركين';
  }

  @override
  String get noMoreChatsFound => 'لم يتم العثور على المزيد من الدردشات...';

  @override
  String get noChatsFoundHere => 'لم يتم العثور على دردشات هنا بعد. ابدأ دردشة جديدة مع شخص ما باستخدام الزر أدناه. ⤵️';

  @override
  String get joinedChats => 'الدردشات المنضمة';

  @override
  String get unread => 'غير مقروء';

  @override
  String get space => 'مساحة';

  @override
  String get spaces => 'مساحات';

  @override
  String get banFromChat => 'حظر من الدردشة';

  @override
  String get banned => 'محظور';

  @override
  String bannedUser(String username, String targetName) {
    return '$username حظر $targetName';
  }

  @override
  String get blockDevice => 'حظر الجهاز';

  @override
  String get blocked => 'محظور';

  @override
  String get botMessages => 'رسائل الروبوت';

  @override
  String get cancel => 'إلغاء';

  @override
  String cantOpenUri(String uri) {
    return 'لا يمكن فتح URI $uri';
  }

  @override
  String get changeDeviceName => 'تغيير اسم الجهاز';

  @override
  String changedTheChatAvatar(String username) {
    return '$username غير صورة الدردشة';
  }

  @override
  String changedTheChatDescriptionTo(String username, String description) {
    return '$username غيّر وصف الدردشة إلى: \'$description\'';
  }

  @override
  String changedTheChatNameTo(String username, String chatname) {
    return '$username غيّر اسم الدردشة إلى: \'$chatname\'';
  }

  @override
  String changedTheChatPermissions(String username) {
    return '$username غيّر أذونات الدردشة';
  }

  @override
  String changedTheDisplaynameTo(String username, String displayname) {
    return '$username غيّر اسمه إلى $displayname';
  }

  @override
  String changedTheGuestAccessRules(String username) {
    return '$username غيّر قواعد وصول الضيف';
  }

  @override
  String changedTheGuestAccessRulesTo(String username, String rules) {
    return '$username غيّر قواعد وصول الضيف إلى: $rules';
  }

  @override
  String changedTheHistoryVisibility(String username) {
    return '$username غيّر رؤية السجل';
  }

  @override
  String changedTheHistoryVisibilityTo(String username, String rules) {
    return '$username غيّر رؤية السجل إلى: $rules';
  }

  @override
  String changedTheJoinRules(String username) {
    return '$username غيّر قواعد الانضمام';
  }

  @override
  String changedTheJoinRulesTo(String username, String joinRules) {
    return '$username غيّر قواعد الانضمام إلى: $joinRules';
  }

  @override
  String changedTheProfileAvatar(String username) {
    return '$username غيّر صورة الملف الشخصي';
  }

  @override
  String changedTheRoomAliases(String username) {
    return '$username غيّر الأسماء المستعارة للغرفة';
  }

  @override
  String changedTheRoomInvitationLink(String username) {
    return '$username غيّر رابط الدعوة';
  }

  @override
  String get changePassword => 'تغيير كلمة المرور';

  @override
  String get changeTheHomeserver => 'تغيير الخادم الرئيسي';

  @override
  String get changeTheme => 'تغيير النمط الخاص بك';

  @override
  String get changeTheNameOfTheGroup => 'تغيير اسم المجموعة';

  @override
  String get changeYourAvatar => 'تغيير صورتك الشخصية';

  @override
  String get channelCorruptedDecryptError => 'تم إفساد التشفير';

  @override
  String get chat => 'دردشة';

  @override
  String get yourChatBackupHasBeenSetUp => 'تم إعداد نسخة احتياطية للدردشة الخاصة بك.';

  @override
  String get chatBackup => 'نسخة احتياطية للدردشة';

  @override
  String get chatBackupDescription => 'تم تأمين رسائلك القديمة بمفتاح استرداد. يرجى التأكد من عدم فقدانه.';

  @override
  String get chatDetails => 'تفاصيل الدردشة';

  @override
  String get chatHasBeenAddedToThisSpace => 'تمت إضافة الدردشة إلى هذه المساحة';

  @override
  String get chats => 'الدردشات';

  @override
  String get chooseAStrongPassword => 'اختر كلمة مرور قوية';

  @override
  String get clearArchive => 'مسح الأرشيف';

  @override
  String get close => 'إغلاق';

  @override
  String get commandHint_markasdm => 'تعيين كغرفة رسائل مباشرة لمعرف Matrix المحدد';

  @override
  String get commandHint_markasgroup => 'تعيين كمجموعة';

  @override
  String get commandHint_ban => 'حظر المستخدم المحدد من هذه الغرفة';

  @override
  String get commandHint_clearcache => 'مسح ذاكرة التخزين المؤقت';

  @override
  String get commandHint_create => 'أنشئ دردشة جماعية فارغة\nاستخدم --no-encryption لتعطيل التشفير';

  @override
  String get commandHint_discardsession => 'تجاهل الجلسة';

  @override
  String get commandHint_dm => 'ابدأ دردشة مباشرة\nاستخدم --no-encryption لتعطيل التشفير';

  @override
  String get commandHint_html => 'إرسال نص بتنسيق HTML';

  @override
  String get commandHint_invite => 'دعوة المستخدم المحدد إلى هذه الغرفة';

  @override
  String get commandHint_join => 'الانضمام إلى الغرفة المحددة';

  @override
  String get commandHint_kick => 'إزالة المستخدم المحدد من هذه الغرفة';

  @override
  String get commandHint_leave => 'مغادرة هذه الغرفة';

  @override
  String get commandHint_me => 'صف نفسك';

  @override
  String get commandHint_myroomavatar => 'تعيين صورتك لهذه الغرفة (عن طريق mxc-uri)';

  @override
  String get commandHint_myroomnick => 'تعيين اسم العرض الخاص بك لهذه الغرفة';

  @override
  String get commandHint_op => 'تعيين مستوى صلاحيات المستخدم المحدد (افتراضي: 50)';

  @override
  String get commandHint_plain => 'إرسال نص غير منسق';

  @override
  String get commandHint_react => 'إرسال الرد كرد فعل';

  @override
  String get commandHint_send => 'إرسال نص';

  @override
  String get commandHint_unban => 'إلغاء حظر المستخدم المحدد من هذه الغرفة';

  @override
  String get commandInvalid => 'أمر غير صالح';

  @override
  String commandMissing(String command) {
    return '$command ليس أمرًا.';
  }

  @override
  String get compareEmojiMatch => 'يرجى مقارنة الرموز التعبيرية';

  @override
  String get compareNumbersMatch => 'يرجى مقارنة الأرقام';

  @override
  String get configureChat => 'تهيئة الدردشة';

  @override
  String get confirm => 'تأكيد';

  @override
  String get connect => 'اتصال';

  @override
  String get contactHasBeenInvitedToTheGroup => 'تمت دعوة جهة الاتصال إلى المجموعة';

  @override
  String get containsDisplayName => 'يحتوي على اسم العرض';

  @override
  String get containsUserName => 'يحتوي على اسم المستخدم';

  @override
  String get contentHasBeenReported => 'تم الإبلاغ عن المحتوى لمسؤولي الخادم';

  @override
  String get copiedToClipboard => 'تم النسخ إلى الحافظة';

  @override
  String get copy => 'نسخ';

  @override
  String get copyToClipboard => 'نسخ إلى الحافظة';

  @override
  String couldNotDecryptMessage(String error) {
    return 'تعذر فك تشفير الرسالة: $error';
  }

  @override
  String countParticipants(int count) {
    return '$count مشارك';
  }

  @override
  String get create => 'إنشاء';

  @override
  String createdTheChat(String username) {
    return '💬 $username أنشأ الدردشة';
  }

  @override
  String get createGroup => 'إنشاء مجموعة';

  @override
  String get createNewSpace => 'مساحة جديدة';

  @override
  String get currentlyActive => 'نشط حاليًا';

  @override
  String get darkTheme => 'داكن';

  @override
  String dateAndTimeOfDay(String date, String timeOfDay) {
    return '$date, $timeOfDay';
  }

  @override
  String dateWithoutYear(String month, String day) {
    return '$month-$day';
  }

  @override
  String dateWithYear(String year, String month, String day) {
    return '$year-$month-$day';
  }

  @override
  String get deactivateAccountWarning => 'سيؤدي ذلك إلى إلغاء تنشيط حساب المستخدم الخاص بك. لا يمكن التراجع عن هذا! هل أنت متأكد؟';

  @override
  String get defaultPermissionLevel => 'مستوى الإذن الافتراضي للمستخدمين الجدد';

  @override
  String get delete => 'حذف';

  @override
  String get deleteAccount => 'حذف الحساب';

  @override
  String get deleteMessage => 'حذف الرسالة';

  @override
  String get device => 'جهاز';

  @override
  String get deviceId => 'معرف الجهاز';

  @override
  String get devices => 'الأجهزة';

  @override
  String get directChats => 'دردشات مباشرة';

  @override
  String get allRooms => 'جميع الدردشات الجماعية';

  @override
  String get displaynameHasBeenChanged => 'تم تغيير اسم العرض';

  @override
  String get downloadFile => 'تنزيل الملف';

  @override
  String get edit => 'تعديل';

  @override
  String get editBlockedServers => 'تعديل الخوادم المحظورة';

  @override
  String get chatPermissions => 'أذونات الدردشة';

  @override
  String get editDisplayname => 'تعديل اسم العرض';

  @override
  String get editRoomAliases => 'تعديل الأسماء المستعارة للغرفة';

  @override
  String get editRoomAvatar => 'تعديل صورة الغرفة';

  @override
  String get emoteExists => 'الرمز التعبيري موجود بالفعل!';

  @override
  String get emoteInvalid => 'اختصار الرمز التعبيري غير صالح!';

  @override
  String get emoteKeyboardNoRecents => 'ستظهر الرموز التعبيرية المستخدمة مؤخرًا هنا...';

  @override
  String get emotePacks => 'حزم الرموز التعبيرية للغرفة';

  @override
  String get emoteSettings => 'إعدادات الرموز التعبيرية';

  @override
  String get globalChatId => 'معرف الدردشة العالمي';

  @override
  String get accessAndVisibility => 'الوصول والرؤية';

  @override
  String get accessAndVisibilityDescription => 'من يُسمح له بالانضمام إلى هذه الدردشة وكيفية اكتشاف الدردشة.';

  @override
  String get calls => 'Calls';

  @override
  String get customEmojisAndStickers => 'رموز تعبيرية وملصقات مخصصة';

  @override
  String get customEmojisAndStickersBody => 'أضف أو شارك رموزًا تعبيرية أو ملصقات مخصصة يمكن استخدامها في أي دردشة.';

  @override
  String get emoteShortcode => 'اختصار الرمز التعبيري';

  @override
  String get emoteWarnNeedToPick => 'تحتاج إلى اختيار اختصار للرمز التعبيري وصورة!';

  @override
  String get emptyChat => 'دردشة فارغة';

  @override
  String get enableEmotesGlobally => 'تمكين حزمة الرموز التعبيرية عالميًا';

  @override
  String get enableEncryption => 'تمكين التشفير';

  @override
  String get enableEncryptionWarning => 'لن تتمكن من تعطيل التشفير بعد الآن. هل أنت متأكد؟';

  @override
  String get encrypted => 'Encrypted';

  @override
  String get encryption => 'تشفير';

  @override
  String get encryptionNotEnabled => 'Encryption is not enabled';

  @override
  String endedTheCall(String senderName) {
    return '$senderName ended the call';
  }

  @override
  String get enterAnEmailAddress => 'Enter an email address';

  @override
  String get homeserver => 'Homeserver';

  @override
  String get enterYourHomeserver => 'Enter your homeserver';

  @override
  String errorObtainingLocation(String error) {
    return 'Error obtaining location: $error';
  }

  @override
  String get everythingReady => 'Everything ready!';

  @override
  String get extremeOffensive => 'Extremely offensive';

  @override
  String get fileName => 'File name';

  @override
  String get stawi => 'Stawi';

  @override
  String get fontSize => 'Font size';

  @override
  String get forward => 'إعادة توجيه';

  @override
  String get fromJoining => 'From joining';

  @override
  String get fromTheInvitation => 'From the invitation';

  @override
  String get goToTheNewRoom => 'Go to the new room';

  @override
  String get group => 'مجموعة';

  @override
  String get chatDescription => 'Chat description';

  @override
  String get chatDescriptionHasBeenChanged => 'Chat description changed';

  @override
  String get groupIsPublic => 'Group is public';

  @override
  String get groups => 'مجموعات';

  @override
  String groupWith(String displayname) {
    return 'Group with $displayname';
  }

  @override
  String get guestsAreForbidden => 'Guests are forbidden';

  @override
  String get guestsCanJoin => 'Guests can join';

  @override
  String hasWithdrawnTheInvitationFor(String username, String targetName) {
    return '$username has withdrawn the invitation for $targetName';
  }

  @override
  String get help => 'مساعدة';

  @override
  String get hideRedactedEvents => 'Hide redacted events';

  @override
  String get hideRedactedMessages => 'Hide redacted messages';

  @override
  String get hideRedactedMessagesBody => 'If someone redacts a message, this message won\'t be visible in the chat anymore.';

  @override
  String get hideInvalidOrUnknownMessageFormats => 'Hide invalid or unknown message formats';

  @override
  String get howOffensiveIsThisContent => 'How offensive is this content?';

  @override
  String get id => 'ID';

  @override
  String get identity => 'Identity';

  @override
  String get block => 'Block';

  @override
  String get blockedUsers => 'Blocked users';

  @override
  String get blockListDescription => 'You can block users who are disturbing you. You won\'t be able to receive any messages or room invites from the users on your personal block list.';

  @override
  String get blockUsername => 'Ignore username';

  @override
  String get iHaveClickedOnLink => 'I have clicked on the link';

  @override
  String get incorrectPassphraseOrKey => 'Incorrect passphrase or recovery key';

  @override
  String get inoffensive => 'Inoffensive';

  @override
  String get inviteContact => 'Invite contact';

  @override
  String inviteContactToGroupQuestion(String contact, String groupName) {
    return 'Do you want to invite $contact to the chat $groupName?';
  }

  @override
  String inviteContactToGroup(String groupName) {
    return 'Invite contact to $groupName';
  }

  @override
  String get noChatDescriptionYet => 'No chat description created yet.';

  @override
  String get tryAgain => 'Try again';

  @override
  String get invalidServerName => 'Invalid server name';

  @override
  String get invited => 'مدعو';

  @override
  String get redactMessageDescription => 'The message will be redacted for all participants in this conversation. This cannot be undone.';

  @override
  String get optionalRedactReason => '(Optional) Reason for redacting this message...';

  @override
  String invitedUser(String username, String targetName) {
    return '📩 $username invited $targetName';
  }

  @override
  String get invitedUsersOnly => 'Invited users only';

  @override
  String get inviteForMe => 'Invite for me';

  @override
  String inviteText(String username, String link) {
    return '$username invited you to stawi. Visit invitation link $link to connect';
  }

  @override
  String get isTyping => 'يكتب…';

  @override
  String joinedTheChat(String username) {
    return '👋 $username joined the chat';
  }

  @override
  String get joinRoom => 'Join room';

  @override
  String kicked(String username, String targetName) {
    return '👞 $username kicked $targetName';
  }

  @override
  String kickedAndBanned(String username, String targetName) {
    return '🙅 $username kicked and banned $targetName';
  }

  @override
  String get kickFromChat => 'Kick from chat';

  @override
  String lastActiveAgo(String localizedTimeShort) {
    return 'Last active: $localizedTimeShort';
  }

  @override
  String get leave => 'Leave';

  @override
  String get leftTheChat => 'Left the chat';

  @override
  String get license => 'License';

  @override
  String get lightTheme => 'Light';

  @override
  String loadCountMoreParticipants(int count) {
    return 'Load $count more participants';
  }

  @override
  String get dehydrate => 'Export session and wipe device';

  @override
  String get dehydrateWarning => 'This action cannot be undone. Ensure you safely store the backup file.';

  @override
  String get dehydrateTor => 'TOR Users: Export session';

  @override
  String get dehydrateTorLong => 'For TOR users, it is recommended to export the session before closing the window.';

  @override
  String get hydrateTor => 'TOR Users: Import session export';

  @override
  String get hydrateTorLong => 'Did you export your session last time on TOR? Quickly import it and continue chatting.';

  @override
  String get hydrate => 'Restore from backup file';

  @override
  String get loadingPleaseWait => 'Loading… Please wait.';

  @override
  String get loadMore => 'Load more…';

  @override
  String get locationDisabledNotice => 'Location services are disabled. Please enable them to be able to share your location.';

  @override
  String get locationPermissionDeniedNotice => 'Location permission denied. Please grant them to be able to share your location.';

  @override
  String get contactPermissionDeniedNotice => 'Contact permission denied. Please grant them to be able to connect with others.';

  @override
  String get login => 'Login';

  @override
  String logInTo(String homeserver) {
    return 'Log in to $homeserver';
  }

  @override
  String get logout => 'Logout';

  @override
  String get memberChanges => 'Member changes';

  @override
  String get mention => 'Mention';

  @override
  String get messages => 'Messages';

  @override
  String get messagesStyle => 'Messages:';

  @override
  String get moderator => 'Moderator';

  @override
  String get muteChat => 'Mute chat';

  @override
  String get needPantalaimonWarning => 'Please be aware that you need Pantalaimon to use end-to-end encryption for now.';

  @override
  String get newChat => 'New chat';

  @override
  String get newMessageInStawi => '💬 New message in Stawi';

  @override
  String get newVerificationRequest => 'New verification request!';

  @override
  String get next => 'Next';

  @override
  String get no => 'No';

  @override
  String get noConnectionToTheServer => 'No connection to the server';

  @override
  String get noEmotesFound => 'No emotes found. 😕';

  @override
  String get noEncryptionForPublicRooms => 'You can only activate encryption as soon as the room is no longer publicly accessible.';

  @override
  String get noGoogleServicesWarning => 'Firebase Cloud Messaging doesn\'t appear to be available on your device. To still receive push notifications, we recommend installing ntfy. With ntfy or another Unified Push provider you can receive push notifications in a data secure way. You can download ntfy from the PlayStore or from F-Droid.';

  @override
  String noMatrixServer(String server1, String server2) {
    return '$server1 is no matrix server, use $server2 instead?';
  }

  @override
  String get shareInviteLink => 'Share invite link';

  @override
  String get scanQrCode => 'Scan QR code';

  @override
  String get none => 'None';

  @override
  String get noPasswordRecoveryDescription => 'You have not added a way to recover your password yet.';

  @override
  String get noPermission => 'No permission';

  @override
  String get noRoomsFound => 'No rooms found…';

  @override
  String get notifications => 'Notifications';

  @override
  String get notificationsEnabledForThisAccount => 'Notifications enabled for this account';

  @override
  String numUsersTyping(int count) {
    return '$count users are typing…';
  }

  @override
  String get obtainingLocation => 'Obtaining location…';

  @override
  String get offensive => 'Offensive';

  @override
  String get offline => 'Offline';

  @override
  String get ok => 'Ok';

  @override
  String get online => 'Online';

  @override
  String get onlineKeyBackupEnabled => 'Online Key Backup is enabled';

  @override
  String get oopsPushError => 'Oops! Unfortunately, an error occurred when setting up the push notifications.';

  @override
  String get oopsSomethingWentWrong => 'Oops, something went wrong…';

  @override
  String get openAppToReadMessages => 'Open app to read messages';

  @override
  String get openCamera => 'Open camera';

  @override
  String get openVideoCamera => 'Open camera for a video';

  @override
  String get oneClientLoggedOut => 'One of your clients has been logged out';

  @override
  String get addAccount => 'Add account';

  @override
  String get editBundlesForAccount => 'Edit bundles for this account';

  @override
  String get addToBundle => 'Add to bundle';

  @override
  String get removeFromBundle => 'Remove from this bundle';

  @override
  String get bundleName => 'Bundle name';

  @override
  String get enableMultiAccounts => '(BETA) Enable multi accounts on this device';

  @override
  String get openInMaps => 'Open in maps';

  @override
  String get link => 'Link';

  @override
  String get serverRequiresEmail => 'This server needs to validate your email address for registration.';

  @override
  String get or => 'Or';

  @override
  String get participant => 'Participant';

  @override
  String get passphraseOrKey => 'passphrase or recovery key';

  @override
  String get password => 'Password';

  @override
  String get passwordForgotten => 'Password forgotten';

  @override
  String get passwordHasBeenChanged => 'Password has been changed';

  @override
  String get hideMemberChangesInPublicChats => 'Hide member changes in public chats';

  @override
  String get hideMemberChangesInPublicChatsBody => 'Do not show in the chat timeline if someone joins or leaves a public chat to improve readability.';

  @override
  String get overview => 'Overview';

  @override
  String get notifyMeFor => 'Notify me for';

  @override
  String get passwordRecoverySettings => 'Password recovery settings';

  @override
  String get passwordRecovery => 'Password recovery';

  @override
  String get people => 'People';

  @override
  String get pickImage => 'Pick an image';

  @override
  String get pin => 'Pin';

  @override
  String play(String fileName) {
    return 'Play $fileName';
  }

  @override
  String get pleaseChoose => 'Please choose';

  @override
  String get pleaseChooseAPasscode => 'Please choose a pass code';

  @override
  String get pleaseClickOnLink => 'Please click on the link in the email and then proceed.';

  @override
  String get pleaseEnter4Digits => 'Please enter 4 digits or leave empty to disable app lock.';

  @override
  String get pleaseEnterRecoveryKey => 'Please enter your recovery key:';

  @override
  String get pleaseEnterYourPassword => 'Please enter your password';

  @override
  String get pleaseEnterYourPin => 'Please enter your pin';

  @override
  String get pleaseEnterYourUsername => 'Please enter your username';

  @override
  String get pleaseFollowInstructionsOnWeb => 'Please follow the instructions on the website and tap on next.';

  @override
  String get privacy => 'Privacy';

  @override
  String get publicRooms => 'Public Rooms';

  @override
  String get pushRules => 'Push rules';

  @override
  String get reason => 'Reason';

  @override
  String get recording => 'Recording';

  @override
  String redactedBy(String username) {
    return 'Redacted by $username';
  }

  @override
  String get directChat => 'Direct chat';

  @override
  String redactedByBecause(String username, String reason) {
    return 'Redacted by $username because: \"$reason\"';
  }

  @override
  String redactedAnEvent(String username) {
    return '$username redacted an event';
  }

  @override
  String get redactMessage => 'Redact message';

  @override
  String get register => 'Register';

  @override
  String get reject => 'Reject';

  @override
  String rejectedTheInvitation(String username) {
    return '$username rejected the invitation';
  }

  @override
  String get rejoin => 'Rejoin';

  @override
  String get removeAllOtherDevices => 'Remove all other devices';

  @override
  String removedBy(String username) {
    return 'Removed by $username';
  }

  @override
  String get removeDevice => 'Remove device';

  @override
  String get unbanFromChat => 'Unban from chat';

  @override
  String get removeYourAvatar => 'Remove your avatar';

  @override
  String get replaceRoomWithNewerVersion => 'Replace room with newer version';

  @override
  String get reply => 'Reply';

  @override
  String get reportMessage => 'Report message';

  @override
  String get requestPermission => 'Request permission';

  @override
  String get roomHasBeenUpgraded => 'Room has been upgraded';

  @override
  String get roomVersion => 'Room version';

  @override
  String get saveFile => 'Save file';

  @override
  String get search => 'Search';

  @override
  String get security => 'Security';

  @override
  String get recoveryKey => 'Recovery key';

  @override
  String get recoveryKeyLost => 'Recovery key lost?';

  @override
  String seenByUser(String username) {
    return 'Seen by $username';
  }

  @override
  String get send => 'Send';

  @override
  String get sendAMessage => 'Send a message';

  @override
  String get sendAsText => 'Send as text';

  @override
  String get sendAudio => 'Send audio';

  @override
  String get sendFile => 'Send file';

  @override
  String get sendImage => 'Send image';

  @override
  String sendImages(int count) {
    return 'Send $count image';
  }

  @override
  String get sendMessages => 'Send messages';

  @override
  String get sendOriginal => 'Send original';

  @override
  String get sendSticker => 'Send sticker';

  @override
  String get sendVideo => 'Send video';

  @override
  String sentAFile(String username) {
    return '📁 $username sent a file';
  }

  @override
  String sentAnAudio(String username) {
    return '🎤 $username sent an audio';
  }

  @override
  String sentAPicture(String username) {
    return '🖼️ $username sent a picture';
  }

  @override
  String sentASticker(String username) {
    return '😊 $username sent a sticker';
  }

  @override
  String sentAVideo(String username) {
    return '🎥 $username sent a video';
  }

  @override
  String sentCallInformations(String senderName) {
    return '$senderName sent call information';
  }

  @override
  String get separateChatTypes => 'Separate Direct Chats and Groups';

  @override
  String get setAsCanonicalAlias => 'Set as main alias';

  @override
  String get setCustomEmotes => 'Set custom emotes';

  @override
  String get setChatDescription => 'Set chat description';

  @override
  String get setInvitationLink => 'Set invitation link';

  @override
  String get setPermissionsLevel => 'Set permissions level';

  @override
  String get setStatus => 'Set status';

  @override
  String get settings => 'Settings';

  @override
  String get share => 'Share';

  @override
  String sharedTheLocation(String username) {
    return '$username shared their location';
  }

  @override
  String get shareLocation => 'Share location';

  @override
  String get showPassword => 'Show password';

  @override
  String get presenceStyle => 'Presence:';

  @override
  String get presencesToggle => 'Show status messages from other users';

  @override
  String get singlesignon => 'Single Sign on';

  @override
  String get skip => 'Skip';

  @override
  String get sourceCode => 'Source code';

  @override
  String get spaceIsPublic => 'Space is public';

  @override
  String get spaceName => 'Space name';

  @override
  String startedACall(String senderName) {
    return '$senderName started a call';
  }

  @override
  String get startFirstChat => 'Start your first chat';

  @override
  String get status => 'Status';

  @override
  String get statusExampleMessage => 'How are you today?';

  @override
  String get submit => 'Submit';

  @override
  String get synchronizingPleaseWait => 'Synchronizing… Please wait.';

  @override
  String synchronizingPleaseWaitCounter(String percentage) {
    return ' Synchronizing… ($percentage%)';
  }

  @override
  String get systemTheme => 'System';

  @override
  String get theyDontMatch => 'They Don\'t Match';

  @override
  String get theyMatch => 'They Match';

  @override
  String get title => 'Stawi';

  @override
  String get toggleFavorite => 'Toggle Favorite';

  @override
  String get toggleMuted => 'Toggle Muted';

  @override
  String get toggleUnread => 'Mark Read/Unread';

  @override
  String get tooManyRequestsWarning => 'Too many requests. Please try again later!';

  @override
  String get transferFromAnotherDevice => 'Transfer from another device';

  @override
  String get tryToSendAgain => 'Try to send again';

  @override
  String get unavailable => 'Unavailable';

  @override
  String unbannedUser(String username, String targetName) {
    return '$username unbanned $targetName';
  }

  @override
  String get unblockDevice => 'Unblock Device';

  @override
  String get unknownDevice => 'Unknown device';

  @override
  String get unknownEncryptionAlgorithm => 'Unknown encryption algorithm';

  @override
  String unknownEvent(String type) {
    return 'Unknown event \'$type\'';
  }

  @override
  String get unmuteChat => 'Unmute chat';

  @override
  String get unpin => 'Unpin';

  @override
  String unreadChats(int unreadCount) {
    String _temp0 = intl.Intl.pluralLogic(
      unreadCount,
      locale: localeName,
      other: '$unreadCount unread chats',
      one: '1 unread chat',
    );
    return '$_temp0';
  }

  @override
  String userAndOthersAreTyping(String username, int count) {
    return '$username and $count others are typing…';
  }

  @override
  String userAndUserAreTyping(String username, String username2) {
    return '$username and $username2 are typing…';
  }

  @override
  String userIsTyping(String username) {
    return '$username is typing…';
  }

  @override
  String userLeftTheChat(String username) {
    return '🚪 $username left the chat';
  }

  @override
  String get username => 'Username';

  @override
  String userSentUnknownEvent(String username, String type) {
    return '$username sent a $type event';
  }

  @override
  String get unverified => 'Unverified';

  @override
  String get verified => 'Verified';

  @override
  String get verify => 'Verify';

  @override
  String get verifyStart => 'Start Verification';

  @override
  String get verifySuccess => 'You successfully verified!';

  @override
  String get verifyTitle => 'Verifying other account';

  @override
  String get videoCall => 'Video call';

  @override
  String get visibilityOfTheChatHistory => 'Visibility of the chat history';

  @override
  String get visibleForAllParticipants => 'Visible for all participants';

  @override
  String get visibleForEveryone => 'Visible for everyone';

  @override
  String get voiceMessage => 'Voice message';

  @override
  String get waitingPartnerAcceptRequest => 'Waiting for partner to accept the request…';

  @override
  String get waitingPartnerEmoji => 'Waiting for partner to accept the emoji…';

  @override
  String get waitingPartnerNumbers => 'Waiting for partner to accept the numbers…';

  @override
  String get wallpaper => 'Wallpaper:';

  @override
  String get warning => 'Warning!';

  @override
  String get weSentYouAnEmail => 'We sent you an email';

  @override
  String get whoCanPerformWhichAction => 'Who can perform which action';

  @override
  String get whoIsAllowedToJoinThisGroup => 'Who is allowed to join this group';

  @override
  String get whyDoYouWantToReportThis => 'Why do you want to report this?';

  @override
  String get wipeChatBackup => 'Wipe your chat backup to create a new recovery key?';

  @override
  String get withTheseAddressesRecoveryDescription => 'With these addresses you can recover your password.';

  @override
  String get writeAMessage => 'Write a message…';

  @override
  String get yes => 'Yes';

  @override
  String get you => 'You';

  @override
  String get youAreNoLongerParticipatingInThisChat => 'You are no longer participating in this chat';

  @override
  String get youHaveBeenBannedFromThisChat => 'You have been banned from this chat';

  @override
  String get yourPublicKey => 'Your public key';

  @override
  String get messageInfo => 'Message info';

  @override
  String get time => 'Time';

  @override
  String get messageType => 'Message Type';

  @override
  String get sender => 'Sender';

  @override
  String get openGallery => 'Open gallery';

  @override
  String get removeFromSpace => 'Remove from space';

  @override
  String get addToSpaceDescription => 'Select a space to add this chat to it.';

  @override
  String get start => 'Start';

  @override
  String get pleaseEnterRecoveryKeyDescription => 'To unlock your old messages, please enter your recovery key that has been generated in a previous session. Your recovery key is NOT your password.';

  @override
  String get publish => 'Publish';

  @override
  String videoWithSize(String size) {
    return 'Video ($size)';
  }

  @override
  String get openChat => 'Open Chat';

  @override
  String get markAsRead => 'Mark as read';

  @override
  String get reportUser => 'Report user';

  @override
  String get dismiss => 'Dismiss';

  @override
  String reactedWith(String sender, String reaction) {
    return '$sender reacted with $reaction';
  }

  @override
  String get pinMessage => 'Pin to room';

  @override
  String get confirmEventUnpin => 'Are you sure to permanently unpin the event?';

  @override
  String get emojis => 'Emojis';

  @override
  String get placeCall => 'Place call';

  @override
  String get voiceCall => 'Voice call';

  @override
  String get unsupportedAndroidVersion => 'Unsupported Android version';

  @override
  String get unsupportedAndroidVersionLong => 'This feature requires a newer Android version. Please check for updates or Lineage OS support.';

  @override
  String get videoCallsBetaWarning => 'Please note that video calls are currently in beta. They might not work as expected or work at all on all platforms.';

  @override
  String get experimentalVideoCalls => 'Experimental video calls';

  @override
  String get emailOrUsername => 'Email or username';

  @override
  String get indexedDbErrorTitle => 'Private mode issues';

  @override
  String get indexedDbErrorLong => 'The message storage is unfortunately not enabled in private mode by default.\nPlease visit\n - about:config\n - set dom.indexedDB.privateBrowsing.enabled to true\nOtherwise, it is not possible to run Stawi.';

  @override
  String switchToAccount(String number) {
    return 'Switch to account $number';
  }

  @override
  String get nextAccount => 'Next account';

  @override
  String get previousAccount => 'Previous account';

  @override
  String get addWidget => 'Add widget';

  @override
  String get widgetVideo => 'Video';

  @override
  String get widgetEtherpad => 'Text note';

  @override
  String get widgetJitsi => 'Jitsi Meet';

  @override
  String get widgetCustom => 'Custom';

  @override
  String get widgetName => 'Name';

  @override
  String get widgetUrlError => 'This is not a valid URL.';

  @override
  String get widgetNameError => 'Please provide a display name.';

  @override
  String get errorAddingWidget => 'Error adding the widget.';

  @override
  String get youRejectedTheInvitation => 'You rejected the invitation';

  @override
  String get youJoinedTheChat => 'You joined the chat';

  @override
  String get youAcceptedTheInvitation => '👍 You accepted the invitation';

  @override
  String youBannedUser(String user) {
    return 'You banned $user';
  }

  @override
  String youHaveWithdrawnTheInvitationFor(String user) {
    return 'You have withdrawn the invitation for $user';
  }

  @override
  String youInvitedToBy(String alias) {
    return '📩 You have been invited via link to:\n$alias';
  }

  @override
  String youInvitedBy(String user) {
    return '📩 You have been invited by $user';
  }

  @override
  String invitedBy(String user) {
    return '📩 Invited by $user';
  }

  @override
  String youInvitedUser(String user) {
    return '📩 You invited $user';
  }

  @override
  String youKicked(String user) {
    return '👞 You kicked $user';
  }

  @override
  String youKickedAndBanned(String user) {
    return '🙅 You kicked and banned $user';
  }

  @override
  String youUnbannedUser(String user) {
    return 'You unbanned $user';
  }

  @override
  String hasKnocked(String user) {
    return '🚪 $user has knocked';
  }

  @override
  String get usersMustKnock => 'Users must knock';

  @override
  String get noOneCanJoin => 'No one can join';

  @override
  String userWouldLikeToChangeTheChat(String user) {
    return '$user would like to join the chat.';
  }

  @override
  String get noPublicLinkHasBeenCreatedYet => 'No public link has been created yet';

  @override
  String get knock => 'Knock';

  @override
  String get users => 'Users';

  @override
  String get unlockOldMessages => 'Unlock old messages';

  @override
  String get storeInSecureStorageDescription => 'Store the recovery key in the secure storage of this device.';

  @override
  String get saveKeyManuallyDescription => 'Save this key manually by triggering the system share dialog or clipboard.';

  @override
  String get storeInAndroidKeystore => 'Store in Android KeyStore';

  @override
  String get storeInAppleKeyChain => 'Store in Apple KeyChain';

  @override
  String get storeSecurlyOnThisDevice => 'Store securely on this device';

  @override
  String countFiles(int count) {
    return '$count files';
  }

  @override
  String get user => 'User';

  @override
  String get custom => 'مخصص';

  @override
  String get foregroundServiceRunning => 'This notification appears when the foreground service is running.';

  @override
  String get screenSharingTitle => 'screen sharing';

  @override
  String get screenSharingDetail => 'You are sharing your screen in FuffyChat';

  @override
  String get callingPermissions => 'Calling permissions';

  @override
  String get callingAccount => 'Calling account';

  @override
  String get callingAccountDetails => 'Allows Stawi to use the native android dialer app.';

  @override
  String get appearOnTop => 'Appear on top';

  @override
  String get appearOnTopDetails => 'Allows the app to appear on top (not needed if you already have Stawi setup as a calling account)';

  @override
  String get otherCallingPermissions => 'Microphone, camera and other Stawi permissions';

  @override
  String get whyIsThisMessageEncrypted => 'Why is this message unreadable?';

  @override
  String get noKeyForThisMessage => 'This can happen if the message was sent before you have signed in to your account at this device.\n\nIt is also possible that the sender has blocked your device or something went wrong with the internet connection.\n\nAre you able to read the message on another session? Then you can transfer the message from it! Go to Settings > Devices and make sure that your devices have verified each other. When you open the room the next time and both sessions are in the foreground, the keys will be transmitted automatically.\n\nDo you not want to lose the keys when logging out or switching devices? Make sure that you have enabled the chat backup in the settings.';

  @override
  String get newGroup => 'New group';

  @override
  String get newSpace => 'New space';

  @override
  String get enterSpace => 'Enter space';

  @override
  String get enterRoom => 'Enter room';

  @override
  String get allSpaces => 'All spaces';

  @override
  String numChats(String number) {
    return '$number chats';
  }

  @override
  String get hideUnimportantStateEvents => 'Hide unimportant state events';

  @override
  String get hidePresences => 'Hide Status List?';

  @override
  String get doNotShowAgain => 'Do not show again';

  @override
  String wasDirectChatDisplayName(String oldDisplayName) {
    return 'Empty chat (was $oldDisplayName)';
  }

  @override
  String get newSpaceDescription => 'Spaces allows you to consolidate your chats and build private or public communities.';

  @override
  String get encryptThisChat => 'Encrypt this chat';

  @override
  String get disableEncryptionWarning => 'For security reasons you can not disable encryption in a chat, where it has been enabled before.';

  @override
  String get sorryThatsNotPossible => 'Sorry... that is not possible';

  @override
  String get deviceKeys => 'Device keys:';

  @override
  String get reopenChat => 'Reopen chat';

  @override
  String get noBackupWarning => 'Warning! Without enabling chat backup, you will lose access to your encrypted messages. It is highly recommended to enable the chat backup first before logging out.';

  @override
  String get noOtherDevicesFound => 'No other devices found';

  @override
  String fileIsTooBigForServer(String max) {
    return 'Unable to send! The server only supports attachments up to $max.';
  }

  @override
  String fileHasBeenSavedAt(String path) {
    return 'File has been saved at $path';
  }

  @override
  String get jumpToLastReadMessage => 'Jump to last read message';

  @override
  String get readUpToHere => 'Read up to here';

  @override
  String get jump => 'Jump';

  @override
  String get openLinkInBrowser => 'Open link in browser';

  @override
  String get reportErrorDescription => '😭 Oh no. Something went wrong. If you want, you can report this bug to the developers.';

  @override
  String get report => 'report';

  @override
  String get signInWithPassword => 'Sign in with password';

  @override
  String get pleaseTryAgainLaterOrChooseDifferentServer => 'Please try again later or choose a different server.';

  @override
  String signInWith(String provider) {
    return 'Sign in with $provider';
  }

  @override
  String get profileNotFound => 'The user could not be found on the server. Maybe there is a connection problem or the user doesn\'t exist.';

  @override
  String get setTheme => 'Set theme:';

  @override
  String get setColorTheme => 'Set color theme:';

  @override
  String get invite => 'دعوة';

  @override
  String get inviteGroupChat => '📨 Invite group chat';

  @override
  String get invitePrivateChat => '📨 Invite private chat';

  @override
  String get invalidInput => 'Invalid input!';

  @override
  String wrongPinEntered(int seconds) {
    return 'Wrong pin entered! Try again in $seconds seconds...';
  }

  @override
  String get pleaseEnterANumber => 'Please enter a number greater than 0';

  @override
  String get archiveRoomDescription => 'The chat will be moved to the archive. Other users will be able to see that you have left the chat.';

  @override
  String get roomUpgradeDescription => 'The chat will then be recreated with the new room version. All participants will be notified that they need to switch to the new chat. You can find out more about room versions at https://spec.matrix.org/latest/rooms/';

  @override
  String get removeDevicesDescription => 'You will be logged out of this device and will no longer be able to receive messages.';

  @override
  String get banUserDescription => 'The user will be banned from the chat and will not be able to enter the chat again until they are unbanned.';

  @override
  String get unbanUserDescription => 'The user will be able to enter the chat again if they try.';

  @override
  String get kickUserDescription => 'The user is kicked out of the chat but not banned. In public chats, the user can rejoin at any time.';

  @override
  String get makeAdminDescription => 'Once you make this user admin, you may not be able to undo this as they will then have the same permissions as you.';

  @override
  String get pushNotificationsNotAvailable => 'Push notifications not available';

  @override
  String get learnMore => 'Learn more';

  @override
  String get yourGlobalUserIdIs => 'Your global user-ID is: ';

  @override
  String noUsersFoundWithQuery(String query) {
    return 'Unfortunately no user could be found with \"$query\". Please check whether you made a typo.';
  }

  @override
  String get knocking => 'Knocking';

  @override
  String chatCanBeDiscoveredViaSearchOnServer(String server) {
    return 'Chat can be discovered via the search on $server';
  }

  @override
  String get searchChatsRooms => 'Search for #chats, @users...';

  @override
  String get nothingFound => 'Nothing found...';

  @override
  String get groupName => 'Group name';

  @override
  String get groupDescription => 'Group description';

  @override
  String get groupConfiguration => 'Group Configuration';

  @override
  String get groupType => 'Group type';

  @override
  String get groupTypeProduct => 'Product Group';

  @override
  String get groupTypeGrameen => 'Default Group';

  @override
  String get groupTypeVoluntary => 'Voluntary Group';

  @override
  String get groupTypeFunding => 'Funding Group';

  @override
  String get groupTypeTemporary => 'Temporary Group';

  @override
  String get groupTypeMerryGoRound => 'Merry Go Round Group';

  @override
  String get groupTypeDescriptionDefault => 'Members are able to save and lend themselves within the group periodically under the grameen methodology. Loans are proportional to the amount of money they save based on allowed leverage settings.';

  @override
  String get groupTypeDescriptionFunding => 'Members of these groups start them for the purpose of lending to grameen groups and gaining some profit. There is no tenure as the members only set a duration in which they are willing to lock their funds for lending to groups. There is a chance of experiencing indefinate lock on some funds when groups are penalized for inactivity.';

  @override
  String get groupTypeDescriptionTemporary => 'These are groups setup with very specific purposes with a definite deadline, they can be for occasions such as funeral fund raisers, wedding and introduction meetings.';

  @override
  String get groupTypeDescriptionVoluntary => 'Organized groups that have a schedule of contribution from the members. Conditions occur in real life before the group does something for the user, example : 1. In church setup, believers may need to make contributions on a weekly basis towards sunday offerings. have a monthly 10% contribution or have a yearly contribution. 2. Teacher unions or groups members contribute a certain fees every so often towards a calamity befalling a member, They may have a conditions such that in case a member does not contribute then when they have issues they will not receive similar assistance.';

  @override
  String get groupTypeDescriptionMerryGoRound => 'Members contribute and have a schedule of a single individual receiving a portion of the periodic savings. This can be say 70% of the contributions with the rest of the contributions shared out equally at the end of the groups cycle.';

  @override
  String get groupTypeDescriptionProduct => 'Product groups are system groups that aid with the functionality of the whole system';

  @override
  String get groupSecret => 'Group secret';

  @override
  String get currency => 'Currency';

  @override
  String get currencySelectDescription => 'Represents the Currency that will be utilized for handling group funds';

  @override
  String get periodicSetup => 'Cycling parameters';

  @override
  String get periodType => 'Period type';

  @override
  String get periodicTypeDescription => 'Period type represents the duration between which members have an obligation towards their group';

  @override
  String get periodTypeWeekly => 'Weekly';

  @override
  String get periodTypeBiWeekly => 'BiWeekly';

  @override
  String get periodTypeMonthly => 'Monthly';

  @override
  String get periodicSavingAmount => 'Periodic Saving Amount';

  @override
  String get periodicSavingAmountDescription => 'Amount saved periodically by members of the group';

  @override
  String get finalizeGroupConfiguration => 'Finalize Group configuration';

  @override
  String finalizeGroupConfigurationDescription(String groupName) {
    return 'Your group $groupName will be configured shortly';
  }

  @override
  String get groupTerminationDate => 'Group termination date';

  @override
  String get groupTerminationDateDescription => 'Date after which the objective of the group would have been completed';

  @override
  String get groupCreationSuccessful => 'Successfully Queued Group Create Request';

  @override
  String groupCreationSuccessfulDescription(String groupName) {
    return 'Group with the name $groupName is being configured, this will take a moment. \n\n Add all the members to the group from your contacts';
  }

  @override
  String get createGroupAndInviteUsers => 'Create a group and invite users';

  @override
  String get groupCanBeFoundViaSearch => 'Group can be found via search';

  @override
  String get wrongRecoveryKey => 'Sorry... this does not seem to be the correct recovery key.';

  @override
  String get startConversation => 'Start conversation';

  @override
  String get commandHint_sendraw => 'Send raw json';

  @override
  String get databaseMigrationTitle => 'Database is optimized';

  @override
  String get databaseMigrationBody => 'Please wait. This may take a moment.';

  @override
  String get leaveEmptyToClearStatus => 'Leave empty to clear your status.';

  @override
  String get select => 'Select';

  @override
  String get searchForUsers => 'Search for @users...';

  @override
  String get pleaseEnterYourCurrentPassword => 'Please enter your current password';

  @override
  String get newPassword => 'New password';

  @override
  String get pleaseChooseAStrongPassword => 'Please choose a strong password';

  @override
  String get passwordsDoNotMatch => 'Passwords do not match';

  @override
  String get passwordIsWrong => 'Your entered password is wrong';

  @override
  String get publicLink => 'Public link';

  @override
  String get publicChatAddresses => 'Public chat addresses';

  @override
  String get createNewAddress => 'Create new address';

  @override
  String get joinSpace => 'Join space';

  @override
  String get publicSpaces => 'Public spaces';

  @override
  String get addChatOrSubSpace => 'Add chat or sub space';

  @override
  String get subspace => 'Subspace';

  @override
  String get decline => 'Decline';

  @override
  String get thisDevice => 'This device:';

  @override
  String get initAppError => 'An error occured while init the app';

  @override
  String get userRole => 'User role';

  @override
  String minimumPowerLevel(String level) {
    return '$level is the minimum power level.';
  }

  @override
  String searchIn(String chat) {
    return 'Search in chat \"$chat\"...';
  }

  @override
  String get searchMore => 'Search more...';

  @override
  String get gallery => 'معرض الصور';

  @override
  String get files => 'ملفات';

  @override
  String databaseBuildErrorBody(String url, String error) {
    return 'Unable to build the SQlite database. The app tries to use the legacy database for now. Please report this error to the developers at $url. The error message is: $error';
  }

  @override
  String sessionLostBody(String url, String error) {
    return 'Your session is lost. Please report this error to the developers at $url. The error message is: $error';
  }

  @override
  String restoreSessionBody(String url, String error) {
    return 'The app now tries to restore your session from the backup. Please report this error to the developers at $url. The error message is: $error';
  }

  @override
  String forwardMessageTo(String roomName) {
    return 'Forward message to $roomName?';
  }

  @override
  String get sendReadReceipts => 'Send read receipts';

  @override
  String get sendTypingNotificationsDescription => 'Other participants in a chat can see when you are typing a new message.';

  @override
  String get sendReadReceiptsDescription => 'Other participants in a chat can see when you have read a message.';

  @override
  String get formattedMessages => 'Formatted messages';

  @override
  String get formattedMessagesDescription => 'Display rich message content like bold text using markdown.';

  @override
  String get verifyOtherUser => '🔐 Verify other user';

  @override
  String get verifyOtherUserDescription => 'If you verify another user, you can be sure that you know who you are really writing to. 💪\n\nWhen you start a verification, you and the other user will see a popup in the app. There you will then see a series of emojis or numbers that you have to compare with each other.\n\nThe best way to do this is to meet up or start a video call. 👭';

  @override
  String get verifyOtherDevice => '🔐 Verify other device';

  @override
  String get verifyOtherDeviceDescription => 'When you verify another device, those devices can exchange keys, increasing your overall security. 💪 When you start a verification, a popup will appear in the app on both devices. There you will then see a series of emojis or numbers that you have to compare with each other. It\'s best to have both devices handy before you start the verification. 🤳';

  @override
  String acceptedKeyVerification(String sender) {
    return '$sender accepted key verification';
  }

  @override
  String canceledKeyVerification(String sender) {
    return '$sender canceled key verification';
  }

  @override
  String completedKeyVerification(String sender) {
    return '$sender completed key verification';
  }

  @override
  String isReadyForKeyVerification(String sender) {
    return '$sender is ready for key verification';
  }

  @override
  String requestedKeyVerification(String sender) {
    return '$sender requested key verification';
  }

  @override
  String startedKeyVerification(String sender) {
    return '$sender started key verification';
  }

  @override
  String get transparent => 'Transparent';

  @override
  String get incomingMessages => 'Incoming messages';

  @override
  String get stickers => 'Stickers';

  @override
  String get discover => 'Discover';

  @override
  String get commandHint_ignore => 'Ignore the given matrix ID';

  @override
  String get commandHint_unignore => 'Unignore the given matrix ID';

  @override
  String unreadChatsInApp(String appname, String unread) {
    return '$appname: $unread unread chats';
  }

  @override
  String get noDatabaseEncryption => 'Database encryption is not supported on this platform';

  @override
  String thereAreCountUsersBlocked(Object count) {
    return 'Right now there are $count users blocked.';
  }

  @override
  String get restricted => 'Restricted';

  @override
  String get knockRestricted => 'Knock restricted';

  @override
  String goToSpace(Object space) {
    return 'Go to space: $space';
  }

  @override
  String get markAsUnread => 'Mark as unread';

  @override
  String userLevel(int level) {
    return '$level - User';
  }

  @override
  String moderatorLevel(int level) {
    return '$level - Moderator';
  }

  @override
  String adminLevel(int level) {
    return '$level - Admin';
  }

  @override
  String get changeGeneralChatSettings => 'Change general chat settings';

  @override
  String get inviteOtherUsers => 'Invite other users to this chat';

  @override
  String get changeTheChatPermissions => 'Change the chat permissions';

  @override
  String get changeTheVisibilityOfChatHistory => 'Change the visibility of the chat history';

  @override
  String get changeTheCanonicalRoomAlias => 'Change the main public chat address';

  @override
  String get sendRoomNotifications => 'Send a @room notifications';

  @override
  String get changeTheDescriptionOfTheGroup => 'Change the description of the chat';

  @override
  String get chatPermissionsDescription => 'Define which power level is necessary for certain actions in this chat. The power levels 0, 50 and 100 are usually representing users, moderators and admins, but any gradation is possible.';

  @override
  String updateInstalled(String version) {
    return '🎉 Update $version installed!';
  }

  @override
  String get changelog => 'Changelog';

  @override
  String get sendCanceled => 'Sending canceled';

  @override
  String get loginWithMatrixId => 'Login with Matrix-ID';

  @override
  String get discoverHomeservers => 'Discover homeservers';

  @override
  String get whatIsAHomeserver => 'What is a homeserver?';

  @override
  String get homeserverDescription => 'All your data is stored on the homeserver, just like an email provider. You can choose which homeserver you want to use, while you can still communicate with everyone. Learn more at at https://matrix.org.';

  @override
  String get doesNotSeemToBeAValidHomeserver => 'Doesn\'t seem to be a compatible homeserver. Wrong URL?';

  @override
  String get calculatingFileSize => 'Calculating file size...';

  @override
  String get prepareSendingAttachment => 'Prepare sending attachment...';

  @override
  String get sendingAttachment => 'Sending attachment...';

  @override
  String get generatingVideoThumbnail => 'Generating video thumbnail...';

  @override
  String get compressVideo => 'Compressing video...';

  @override
  String sendingAttachmentCountOfCount(int index, int length) {
    return 'Sending attachment $index of $length...';
  }

  @override
  String serverLimitReached(int seconds) {
    return 'Server limit reached! Waiting $seconds seconds...';
  }

  @override
  String get oneOfYourDevicesIsNotVerified => 'One of your devices is not verified';

  @override
  String get noticeChatBackupDeviceVerification => 'Note: When you connect all your devices to the chat backup, they are automatically verified.';

  @override
  String get continueText => 'Continue';

  @override
  String get welcomeText => 'Create or join groups with the aim of saving, getting credit or offering loans to other members';

  @override
  String get blur => 'Blur:';

  @override
  String get opacity => 'Opacity:';

  @override
  String get setWallpaper => 'Set wallpaper';

  @override
  String get manageAccount => 'Manage account';

  @override
  String get noContactInformationProvided => 'Server does not provide any valid contact information';

  @override
  String get contactServerAdmin => 'Contact server admin';

  @override
  String get contactServerSecurity => 'Contact server security';

  @override
  String get supportPage => 'Support page';

  @override
  String get serverInformation => 'Server information:';

  @override
  String get name => 'Name';

  @override
  String get version => 'Version';

  @override
  String get website => 'Website';

  @override
  String get compress => 'Compress';

  @override
  String get boldText => 'Bold text';

  @override
  String get italicText => 'Italic text';

  @override
  String get strikeThrough => 'Strikethrough';

  @override
  String get pleaseFillOut => 'Please fill out';

  @override
  String get invalidUrl => 'Invalid url';

  @override
  String get addLink => 'Add link';

  @override
  String get unableToJoinChat => 'Unable to join chat. Maybe the other party has already closed the conversation.';

  @override
  String get previous => 'Previous';

  @override
  String get otherPartyNotLoggedIn => 'The other party is currently not logged in and therefore cannot receive messages!';

  @override
  String appWantsToUseForLogin(String server) {
    return 'Use \'$server\' to log in';
  }

  @override
  String get appWantsToUseForLoginDescription => 'You hereby allow the app and website to share information about you.';

  @override
  String get open => 'Open';

  @override
  String get waitingForServer => 'Waiting for server...';

  @override
  String get appIntroduction => 'Join or create friendly chat groups with the aim of growing financially. Learn more at https://stawi.im or just tap *Continue*.';

  @override
  String get newChatRequest => '📩 New chat request';

  @override
  String get contentNotificationSettings => 'Content notification settings';

  @override
  String get generalNotificationSettings => 'General notification settings';

  @override
  String get roomNotificationSettings => 'Room notification settings';

  @override
  String get userSpecificNotificationSettings => 'User specific notification settings';

  @override
  String get otherNotificationSettings => 'Other notification settings';

  @override
  String get notificationRuleContainsUserName => 'Contains User Name';

  @override
  String get notificationRuleContainsUserNameDescription => 'Notifies the user when a message contains their username.';

  @override
  String get notificationRuleMaster => 'Mute all notifications';

  @override
  String get notificationRuleMasterDescription => 'Overrides all other rules and disables all notifications.';

  @override
  String get notificationRuleSuppressNotices => 'Suppress Automated Messages';

  @override
  String get notificationRuleSuppressNoticesDescription => 'Suppresses notifications from automated clients like bots.';

  @override
  String get notificationRuleInviteForMe => 'Invite for Me';

  @override
  String get notificationRuleInviteForMeDescription => 'Notifies the user when they are invited to a room.';

  @override
  String get notificationRuleMemberEvent => 'Member Event';

  @override
  String get notificationRuleMemberEventDescription => 'Suppresses notifications for membership events.';

  @override
  String get notificationRuleIsUserMention => 'User Mention';

  @override
  String get notificationRuleIsUserMentionDescription => 'Notifies the user when they are directly mentioned in a message.';

  @override
  String get notificationRuleContainsDisplayName => 'Contains Display Name';

  @override
  String get notificationRuleContainsDisplayNameDescription => 'Notifies the user when a message contains their display name.';

  @override
  String get notificationRuleIsRoomMention => 'Room Mention';

  @override
  String get notificationRuleIsRoomMentionDescription => 'Notifies the user about room mentions.';

  @override
  String get notificationRuleRoomnotif => 'Room Notification';

  @override
  String get notificationRuleRoomnotifDescription => 'Notifies the user about room deactivation messages.';

  @override
  String get notificationRuleTombstone => 'Tombstone';

  @override
  String get notificationRuleTombstoneDescription => 'Notifies the user about room deactivation messages.';

  @override
  String get notificationRuleReaction => 'Reaction';

  @override
  String get notificationRuleReactionDescription => 'Suppresses notifications for reactions.';

  @override
  String get notificationRuleRoomServerAcl => 'Room Server ACL';

  @override
  String get notificationRuleRoomServerAclDescription => 'Suppresses notifications for room server access control lists (ACL).';

  @override
  String get notificationRuleSuppressEdits => 'Suppress Edits';

  @override
  String get notificationRuleSuppressEditsDescription => 'Suppresses notifications for edited messages.';

  @override
  String get notificationRuleCall => 'Call';

  @override
  String get notificationRuleCallDescription => 'Notifies the user about calls.';

  @override
  String get notificationRuleEncryptedRoomOneToOne => 'Encrypted Room One-to-One';

  @override
  String get notificationRuleEncryptedRoomOneToOneDescription => 'Notifies the user about messages in encrypted one-to-one rooms.';

  @override
  String get notificationRuleRoomOneToOne => 'Room One-to-One';

  @override
  String get notificationRuleRoomOneToOneDescription => 'Notifies the user about messages in one-to-one rooms.';

  @override
  String get notificationRuleMessage => 'Message';

  @override
  String get notificationRuleMessageDescription => 'Notifies the user about general messages.';

  @override
  String get notificationRuleEncrypted => 'Encrypted';

  @override
  String get notificationRuleEncryptedDescription => 'Notifies the user about messages in encrypted rooms.';

  @override
  String get notificationRuleJitsi => 'Jitsi';

  @override
  String get notificationRuleJitsiDescription => 'Notifies the user about Jitsi widget events.';

  @override
  String get notificationRuleServerAcl => 'Suppress Server ACL Events';

  @override
  String get notificationRuleServerAclDescription => 'Suppresses notifications for Server ACL events.';

  @override
  String unknownPushRule(String rule) {
    return 'Unknown push rule \'$rule\'';
  }

  @override
  String get deletePushRuleCanNotBeUndone => 'If you delete this notification setting, this can not be undone.';

  @override
  String get more => 'More';

  @override
  String get shareKeysWith => 'Share keys with...';

  @override
  String get shareKeysWithDescription => 'Which devices should be trusted so that they can read along your messages in encrypted chats?';

  @override
  String get allDevices => 'All devices';

  @override
  String get crossVerifiedDevicesIfEnabled => 'Cross verified devices if enabled';

  @override
  String get crossVerifiedDevices => 'Cross verified devices';

  @override
  String get verifiedDevicesOnly => 'Verified devices only';

  @override
  String get poll => 'Poll';

  @override
  String get question => 'Question';

  @override
  String get answer => 'Answer';

  @override
  String get resultsDisclosed => 'Results disclosed';

  @override
  String get resultsUndisclosed => 'Results undisclosed';

  @override
  String get addAnswer => 'Add answer';

  @override
  String get deleteAnswer => 'Delete answer';

  @override
  String startedAPoll(String sender) {
    return '$sender started a poll';
  }

  @override
  String countVotes(int votes, num percentage) {
    String _temp0 = intl.Intl.pluralLogic(
      votes,
      locale: localeName,
      other: '$votes votes',
      one: '1 vote',
    );
    return '$_temp0 - $percentage%';
  }

  @override
  String get chatSettings => 'Chat Settings';

  @override
  String get finance => 'Finance';

  @override
  String get savingsOptions => 'Savings Options';

  @override
  String get votingMode => 'Voting Mode';

  @override
  String get normalVoting => 'Normal Voting';

  @override
  String get delegatedVoting => 'Delegated Voting';

  @override
  String get normalVotingDescription => 'All members vote directly on proposals. Each member has one vote and decisions are made by majority.';

  @override
  String get delegatedVotingDescription => 'Members can delegate their voting power to trusted representatives who vote on their behalf, allowing for expertise-based decision making.';

  @override
  String get votingThreshold => 'Voting Threshold';

  @override
  String get votingThresholdDescription => 'Percentage of members required to vote on a motion before action is taken or canceled.';

  @override
  String get save => 'Save';

  @override
  String get enterContactName => 'Enter contact name';

  @override
  String errorFieldRequired(String fieldName) {
    return 'field is empty, please fill it out';
  }

  @override
  String errorFieldShouldBeNumeric(String fieldName) {
    return 'field is not a valid number';
  }

  @override
  String errorFieldShouldBeInTheFuture(String fieldName) {
    return 'field is should be in the future';
  }

  @override
  String get fixErrorsInStep => 'Please fix the errors in this step before proceeding';

  @override
  String get calendarSelection => 'تاريخ الادخار';

  @override
  String get selectStartDate => 'اختر تاريخ البدء';

  @override
  String get startDateDescription => 'اختر تاريخ بدء لادخار مجموعتك. سيتم تمييز تواريخ الادخار المستقبلية بناءً على نوع الفترة.';

  @override
  String get groupSchedule => 'جدول المجموعة';

  @override
  String get futureSavingDates => 'استنادًا إلى اختيارك، هذه هي تواريخ الجدول التالية:';

  @override
  String get totalBalance => 'إجمالي الرصيد';

  @override
  String get groupSettings => 'إعدادات المجموعة';

  @override
  String get saveChanges => 'حفظ التغييرات';

  @override
  String get back => 'رجوع';

  @override
  String get general => 'عام';

  @override
  String get loans => 'قروض';

  @override
  String get contributions => 'مساهمات';

  @override
  String settingsCount(int n) {
    return '$n إعدادات';
  }

  @override
  String get loanTenure => 'مدة القرض';

  @override
  String get loanTenureDescription => 'الحد الأقصى لعدد الأسابيع التي يمكن للأعضاء الاقتراض خلالها';

  @override
  String get groupTenure => 'مدة المجموعة';

  @override
  String get groupTenureDescription => 'إجمالي مدة المجموعة قبل توزيع الأسهم';

  @override
  String get interestRate => 'معدل الفائدة';

  @override
  String get interestRateDescription => 'النسبة المئوية المفروضة على القروض';

  @override
  String get socialFundContribution => 'مساهمة الصندوق الاجتماعي';

  @override
  String get socialFundContributionDescription => 'المبلغ الذي يساهم به كل عضو في الصندوق الاجتماعي';

  @override
  String get allowEarlyWithdrawal => 'السماح بالسحب المبكر';

  @override
  String get allowEarlyWithdrawalDescription => 'ما إذا كان يمكن للأعضاء سحب الأموال قبل نهاية مدة المجموعة';

  @override
  String get requireSavingsBeforeLoan => 'طلب ادخار قبل القرض';

  @override
  String get requireSavingsBeforeLoanDescription => 'ما إذا كان يجب أن يكون لدى الأعضاء مدخرات قبل أن يتمكنوا من أخذ قرض';

  @override
  String get weeks => 'أسابيع';

  @override
  String get months => 'أشهر';

  @override
  String get year => 'سنة';
}
