package likey;

public class LikeyDTO {

    String userId;
    int evaluationId;
    String userIp;



    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public int getEvaluationId() {
        return evaluationId;
    }

    public void setEvaluationId(int evaluationId) {
        this.evaluationId = evaluationId;
    }

    public String getUserIp() {
        return userIp;
    }

    public void setUserIp(String userIp) {
        this.userIp = userIp;
    }

    public LikeyDTO(){
    }

    public LikeyDTO(String userId, int evaluationId, String userIp) {
        this.userId = userId;
        this.evaluationId = evaluationId;
        this.userIp = userIp;
    }

}
