Iamport.configure do |config|
    # Admin 체험버전 api_key, api_secret
    config.api_key = "4955952430566046"
    config.api_secret = "Q6JC6jwyg66cGlG2peG1k7DmCDtrUehKk1nrlT0B07NGstJSIqU2yxpaaTC57TQsVdUg7US81FOu9ymS"
end

class PaymentController < ApplicationController
    def new;end
    def show
        # TODO: 결제 처리에 필요한 사전 준비를 합니다.

        # Query payment info
        result = Iamport.payment(params[:id])
        if result["code"] == 0
            # Query success
            payment = result["response"]

            # IMP.request_pay({
            #      custom_data : {my_key : value}
            # });
            # 와 같이 custom_data를 결제 건에 대해서 지정하였을 때 정보를 추출할 수 있습니다.
            # (서버에는 json encoded형태로 저장하고 Response Model에서 json_decode 처리합니다.)
            puts payment["custom_data"]

            # paid_at, failed_at 값은 UNIX timestamp 로 표현됩니다.
            # 필요할 경우 읽기 편한 형태로 변환하여 사용합니다.
            puts payment["paid_at"]             # UNIX timestamp
            puts Time.at(payment["paid_at"])    # Ruby time format

            # TODO: 가맹점 결제 예정 금액을 가맹점 시스템에 맞게 조회합니다.
            # 아래 예제에서는 코드 진행을 위해 조회된 금액과 일치하도록 되어 있습니다.
            amount_should_be_paid = payment["amount"]

            # 내부적으로 결제완료 처리하시기 위해서는 (1) 결제완료 여부 (2) 금액이 일치하는지 확인을 해주셔야 합니다.
            if payment["status"] == "paid" && payment["amount"] == amount_should_be_paid
                # TODO: 결제 완료 처리를 진행합니다.
                puts "결제 금액 일치"
            else
                # TODO: 결제 금액 불일치시 예외 처리를 진행합니다.
                puts "결제 금액 불일치"
            end
        else
            # TODO: 결과 조회 실패시 필요한 예외 처리를 진행합니다.
            puts "아임포트 API 에러코드 : #{result['code']}"
            puts "아임포트 API 에러메시지 : #{result['message']}"
        end

        # TODO: 기타 필요한 처리를 수행합니다.

        # TODO: 프론트엔드의 요구사항에 맞게 결과를 준비합니다.
        # 예제에서는 아임포트로부터 받은 결과를 json으로 그대로 넘겨줍니다.
        render json: result
    end

    def create
        # 결제 취소에 필요한 사전 준비를 합니다.

        # 클라이언트로부터 전달받은 주문번호, 환불사유, 환불금액
        imp_uid = params[:imp_uid]
        merchant_uid = params[:merchant_uid]
        reason = params[:reason]
        cancel_request_amount = params[:cancel_request_amount]

        puts imp_uid
        puts merchant_uid
        puts reason
        puts cancel_request_amount

        # TODO: 가맹점 환불할 결제 정보를 가맹점 시스템에 맞게 조회합니다.
        # 아래 예제에서는 코드 진행을 위해 임의의 큰 금액으로 되어 있습니다.
        paid_amount = 10000000
        canceled_amount = 0

        # 환불 가능 금액을 계산합니다.
        cancelable_amount = paid_amount - canceled_amount
        
        result = ""
        if cancelable_amount < cancel_request_amount
            # TODO: 환불 취소 처리를 진행합니다.
        else
            # 환불 고유번호(imp_uid 혹은 merchant_uid)로 승인된 결제를 취소할 수 있습니다.
            # 환불고유번호는 imp_uid가 merchant_uid보다 우선시 됩니다.
            body = {
                imp_uid: imp_uid,
                merchant_uid: merchant_uid,
                amount: cancel_request_amount,
                reason: reason,
            }
            result = Iamport.cancel(body)
        end

        # TODO: 기타 필요한 처리를 수행합니다.

        # TODO: 프론트엔드의 요구사항에 맞게 결과를 준비합니다.
        # 예제에서는 아임포트로부터 받은 결과를 json으로 그대로 넘겨줍니다.
        render json: result
    end
end
