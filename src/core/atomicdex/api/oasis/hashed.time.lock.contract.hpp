#pragma once

//! STD
#include <optional>
#include <variant>

//! Deps
#include <nlohmann/json_fwd.hpp>

namespace atomic_dex::oasis::api
{
    using t_contract_id     = std::string;
    using t_contract_status = std::string;
    using t_asset_quantity  = double;
    using t_asset           = std::string;

    struct elliptic_curve_key
    {
        std::string kty{"EC"};
        std::string crv{"P-256"};
        std::string x;
        std::string y;
    };

    void to_json(nlohmann::json& j, const elliptic_curve_key& eck);
    void from_json(const nlohmann::json& j, elliptic_curve_key& eck);

    using t_beneficiary = elliptic_curve_key;

    struct hash
    {
        std::string algorithm;
        std::string value;
    };

    void to_json(nlohmann::json& j, const hash& cfg);
    void from_json(const nlohmann::json& j, hash& cfg);

    struct preimage
    {
        std::size_t                size{32};
        std::optional<std::string> value;
    };

    void to_json(nlohmann::json& j, const preimage& cfg);
    void from_json(const nlohmann::json& j, preimage& cfg);

    struct sepa_recipient
    {
        std::string name;
        std::string iban;
        std::string bic;
    };

    void from_json(const nlohmann::json& j, sepa_recipient& cfg);

    struct clearing_instructions
    {
        std::string                     type;        ///< Can be a mock or a sepa
        std::optional<t_asset_quantity> amount;      ///< only available in sepa
        std::optional<sepa_recipient>   recipient;   ///< only available in sepa
        std::optional<std::string>      purpose;     ///< only availabl in sepa
        std::optional<std::string>      description; ///< only available in mock
    };

    void from_json(const nlohmann::json& j, clearing_instructions& cfg);

    struct clearing
    {
        std::string                                       status;
        std::optional<std::vector<clearing_instructions>> options;
    };

    void from_json(const nlohmann::json& j, clearing& cfg);

    struct settlement
    {
    };

    struct hashed_timed_lock_contract
    {
        std::optional<t_contract_id>     id{std::nullopt};
        std::optional<t_contract_status> status{std::nullopt};
        std::string                      asset;
        t_asset_quantity                 amount;
        t_beneficiary                    beneficiary;
        hash                             hash;
        preimage                         preimage;
        std::string                      expires;
        std::optional<clearing>          clearing;
        std::optional<settlement>        settlement;
        std::optional<bool>              include_fee;
    };

    void from_json(const nlohmann::json& j, hashed_timed_lock_contract& htlc);
    void to_json(nlohmann::json& j, const hashed_timed_lock_contract& htlc);
} // namespace atomic_dex::oasis::api