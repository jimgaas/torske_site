__all__ = ["_Meta", "Contact", "Contact_Group", "Contact_Group_Member", "Email_Group", "Email_Group_Member", "Event", "Guest", "Invitation", "Member", "Payment", "Reservation", "Reservation_Change", "Waitlist"]
from dataclasses import dataclass
from fastlite.kw import UNSET
@dataclass
class _Meta:
    id: int | None = UNSET
    version: int | None = UNSET

@dataclass
class Contact:
    id: int | None = UNSET
    first_name: str | None = UNSET
    last_name: str | None = UNSET
    email: str | None = UNSET

@dataclass
class Contact_Group:
    id: int | None = UNSET
    name: str | None = UNSET

@dataclass
class Contact_Group_Member:
    id: int | None = UNSET
    group_id: int | None = UNSET
    contact_id: int | None = UNSET

@dataclass
class Email_Group:
    id: int | None = UNSET
    name: str | None = UNSET

@dataclass
class Email_Group_Member:
    id: int | None = UNSET
    group_id: int | None = UNSET
    member_id: int | None = UNSET

@dataclass
class Event:
    id: int | None = UNSET
    name: str | None = UNSET
    date: int | None = UNSET
    place: str | None = UNSET
    cost: int | None = UNSET
    description: str | None = UNSET
    map_link: str | None = UNSET
    deadline: int | None = UNSET

@dataclass
class Guest:
    id: int | None = UNSET
    reservation_id: int | None = UNSET
    guest_name: str | None = UNSET

@dataclass
class Invitation:
    id: int | None = UNSET
    event_id: int | None = UNSET
    member_id: int | None = UNSET
    status: str | None = UNSET

@dataclass
class Member:
    id: int | None = UNSET
    first_name: str | None = UNSET
    last_name: str | None = UNSET
    suffix: str | None = UNSET
    email: str | None = UNSET

@dataclass
class Payment:
    id: int | None = UNSET
    reservation_id: int | None = UNSET
    total_lunches: int | None = UNSET
    total_owed: float | None = UNSET
    cash_amt: float | None = UNSET
    check_amt: float | None = UNSET
    card_amt: float | None = UNSET
    cash_back: float | None = UNSET
    balance_due: float | None = UNSET
    notes: str | None = UNSET
    date_paid: str | None = UNSET

@dataclass
class Reservation:
    id: int | None = UNSET
    invitation_id: int | None = UNSET
    paid: int | None = UNSET
    created_at: int | None = UNSET
    stripe_payment_intent: str | None = UNSET

@dataclass
class Reservation_Change:
    id: int | None = UNSET
    reservation_id: int | None = UNSET
    first_name: str | None = UNSET
    last_name: str | None = UNSET
    old_status: str | None = UNSET
    new_status: str | None = UNSET
    old_guests: int | None = UNSET
    new_guests: int | None = UNSET
    changed_by: str | None = UNSET
    changed_at: str | None = UNSET
    changed_at_unix: int | None = UNSET
    email_sent: int | None = UNSET

@dataclass
class Waitlist:
    id: int | None = UNSET
    event_id: int | None = UNSET
    member_id: int | None = UNSET
    created_at: int | None = UNSET
    status: str | None = UNSET

