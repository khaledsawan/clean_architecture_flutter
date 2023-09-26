// ignore_for_file: constant_identifier_names

class AppApiUrl {
  /*  for app   */
  static const String APP_NAME = "School";
  static const int APP_VERSION = 1;

  /*  for api   */

  //for base Uri
  static const String BASE_URL =
      "http://online-free-course.000webhostapp.com"; //http://online-free-course.000webhostapp.com
  static const String NOTI_KEY =
      "AAAAwjICafo:APA91bGl4kOs_x7Wl9wdFaOkcJSorNZsXdvT_durj5fG6bu21wE6r5_vvRY9tHi_NIPhdcNuD4CeIq2F_dlLzTnU-PX9qQCtLGvHbUE9_69jlvoXaIUQ1OczlEeVoFOOvB9HqBGDIZVf";
  static const String IMAGE_PATH = "";

  //for student course
  static const String STUDENT_COURSES_URL = "/api/indexCoursesStudent";
  static const String STUDENT_SEARCH_COURSE_URL = "/api/searchStudent";
  static const String STUDENTCOURSES_URL = "/api/showStudent";
  static const String STUDENT_SHOW_VIDEO_URL = "/api/showVideoStudent";
  static const String STUDENT_COURSE_VIDEOS_SEARCH_URL =
      "/api/searchCourseVideosStudent";
  // Admin Teacher
  static const String ADMIN_TEACHER_INDEX = "/api/indexTeacher";
  static const String ADMIN_TEACHER_SEARCH = "/api/searchTeachers";
  static const String ADMIN_TEACHER_PROFILE = "/api/showTeacherProfile";
  static const String ADMIN_TEACHER_DELETE = "/api/destroyTeacher";
  static const String ADMIN_TEACHER_STORE = "/api/registerTeacher";
  static const String ADMIN_TEACHER_UPDATE = "/api/updateTeacherProfile";
  // Admin Student
  static const String ADMIN_STUDENT_INDEX = "/api/indexStudent";
  static const String ADMIN_STUDENT_SEARCH = "/api/searchStudents";
  static const String ADMIN_STUDENT_PROFILE = "/api/showStudentProfile";
  static const String ADMIN_STUDENT_DELETE = "/api/deleteStudent";
  // static const String ADMIN_STUDENT_STORE = "/api/registerTeacher";
  static const String ADMIN_STUDENT_UPDATE = "/api/adminStudentUpdateProfile";
  //for teacher course
  static const String TEACHER_COURSES_URL = "/api/indexCoursesTeacher";
  static const String TEACHER_COURSE_SEARCH_URL = "/api/searchTeacher";
  static const String TEACHER_STORE_COURSE_URL = "/api/storeCourseTeacher";
  static const String TEACHER_COURSE_VIDEOS_SEARCH_URL =
      "/api/searchCourseVideosTeacher";
  static const String TEACHER_VIDEO_SEARCH_URL = "/api/searchVideoTeacher";
  static const String TEACHER_VIEW_COURSE_URL = "/api/showStudent";
  static const String TEACHER_ADD_VIDEO_URL = "/api/storeVideoTeacher";
  static const String TEACHER_UPDATE_COURSE_URL = "/api/updateCourseTeacher";
  static const String TEACHER_DESTROY_VIDOE = "/api/destroyVideoTeacher";
  static const String TEACHER_DESTROY_COURSE = "/api/destroyTeacherCourse";
  static const String TEACHER_SHOW_VIDEO = "/api/showVideoTeacher";
  // Category
  static const String CATEGORY_INDEX_URL = "/api/indexCategory";
  static const String CATEGORY_ADD_URL = "/api/storeCategory";
  static const String CATEGORY_DELETE_URL = "/api/deleteCategory";

  //for Ad
  static const String AD_INDEX_URL = "/api/indexAd";
  static const String AD_VIEW_URL = "/api/showAd";
  static const String AD_ADD_URL = "/api/storeAd";
  static const String AD_DELETE_URL = "/api/destroyAd";

  //for comments
  static const String INDEX_VIDEO_COMMENT = "/api/comment/indexVideoComment";
  static const String STORE_COMMENT = "/api/comment/store";
  static const String REPLY_COMMENT = "/api/comment/replyStore";
  static const String DELETE_COMMENT = "/api/comment/destroy";
  static const String REPORT_COMMENT = "/api/comment/report";
  static const String EDIT_COMMENT = "/api/comment/update";

  //for Auth
  static const String REGISTER_STUDENT_URL = "/api/registerStudent";
  static const String LOGIN_URL = "/api/login";
  static const String VERIFY_EMAIL = "/api/ActivateEmail";
  static const String FORGET_PASSWORD = "/api/forgot_password";
  static const String RESEND_OTP = "/api/resend_code";
  static const String UPDATE_USER_PROFILE = "/api/v1/customer/update-profile";

  //for notification
  static const String NOTIFI_URL = 'https://fcm.googleapis.com/fcm/send';
  static const String GET_TOPIC = '/api/indexTopicAdmin';
  static const String STORE_TOPIC = '/api/storeTopic';
  static const String IS_TOPIC = '/api/isTopic';
  static const String DESTROY_TOPIC = '/api/destroyTopic';
  static const String NOTIFICATION = 'NOTIFICATION';
  static const String NOTIFICATION_LIST = 'NOTIFICATION_LIST';

  /*  for local storage   */

  //for Auth
  static const String TOKEN = "token";
  static const String ROLE = "role";
  static const String PHONE = "phone";
  static const String PASSWORD = "password";
  static const String EMAIL = "email";
  static const String VERIFY = "verify";
  static const String VERIFYTOKEN = "verifyToken";
  static const String USERID = "USERID";

  //play list
  static const String PLAY_LIST = 'PLAY_LIST';
  static const String MY_PLAYLIST_URL = '/api/indexPlayList';
  static const String CREATE_PLAYLIST_URL = '/api/storePlayList';
  static const String ADD_VIDEO_TO_PLAYLIST_URL = '/api/storePlayListVideo';
  static const String DELETE_PLAYLIST_URL = '/api/destroyPlayList';
  static const String VIEW_PLAYLIST_URL = '/api/showPlayList';

  //teacher config
  static const String TEACHER_PROFILE_URL = "/api/getProfile";
  //student config
  static const String STUDENT_PROFILE_URL = "/api/getProfileStudent";
  static const String STUDENT_UPDATE_PROFILE_URL = "/api/studentUpdateProfile";

  static const String INTRO = "intro";
  static const String DARK_MODE = "darkmode";
}
