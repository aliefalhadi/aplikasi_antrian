enum ViewState { Idle, Fetching, Sending, FetchNull, Success, ErrConnection }


// get data server
// ViewState => Fetching (kasi animasi loading)
// data nya tu kosong ViewState => FetchNull
// data nya data ViewState => Idle